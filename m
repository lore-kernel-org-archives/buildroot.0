Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BC6C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 07:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D473242028;
	Fri, 28 Jul 2023 07:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D473242028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-jmhmZ5nQbZ; Fri, 28 Jul 2023 07:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A165241D7B;
	Fri, 28 Jul 2023 07:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A165241D7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 348541BF489
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD45613C2
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD45613C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzpZDkpPPIqD for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 07:27:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A245961388
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 07:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A245961388
Received: by mail.gandi.net (Postfix) with ESMTPSA id 605C9E0002;
 Fri, 28 Jul 2023 07:26:57 +0000 (UTC)
Date: Fri, 28 Jul 2023 09:26:56 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230728092656.5ae69f0f@windsurf>
In-Reply-To: <20230728052530.1122268-1-christian@aperture.us>
References: <20230728052530.1122268-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690529218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5jWoTRj+jB+0O0uUAEh5jZPy+s8iD81UeEkDZyftf0=;
 b=aj6DWclaPhA7mRZA9pCCTLIM9GQ7JPGiA029KotzhWbHrDTCyWa3K8kfbTmuxOJ2gP4msE
 LzZGJzIsMo8ACYtFjq7QJGTJ81ADB6HbxaPIY4uiP/UA/AEorE7l9u4BITzewhZvXj7tqy
 fCAcLmM/vPazoivgKg5Y8HMrW22FMmXNTyOXu/e/prVg5C1dNAngf5wTo4kGbJcsL3Cq68
 1+rO817y5uxL45ene3d8ryqQ4NDBBxQR9mtcUL2BkERuRqu6rCvPleV5uoOY3PwC0Fz0Xv
 bwH81StqxnL3qJWSnT3ZZX936Gb2TKJ0PeKxKf8ho3ERZiXwYBjHhg3GPLtjMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aj6DWcla
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: add toolchain as
 dependency of host-go
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Thu, 27 Jul 2023 22:25:30 -0700
Christian Stewart <christian@aperture.us> wrote:

> Running "make host-go" in a clean Buildroot tree causes a build failure:
> 
> Building Go cmd/dist using /host/lib/go-1.19.10. (go1.19.10 linux/amd64)
> go tool dist: cannot invoke C compiler ["/host/bin/arm-linux-gcc"]:
> fork/exec /host/bin/arm-linux-gcc: no such file or directory
> 
> Go needs a system C compiler for use with cgo.
> To set a C compiler, set CC=the-compiler.
> To disable cgo, set CGO_ENABLED=0.
> 
> Despite the fact that we're compiling the Go compiler and not compiling anything
> for the target system, the Go compiler make.bash still attempts to call the
> target C compiler during the build process.
> 
> The dependency on toolchain is necessary only for host-go and not the other
> host-go-bootstrap packages as we only pass the path to the target compiler to
> the final host-go compiler package make.bash.
> 
> Fix the issue by adding toolchain to the host-go package dependencies.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index efa47e5781..ada343f766 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -12,7 +12,8 @@ GO_LICENSE = BSD-3-Clause
>  GO_LICENSE_FILES = LICENSE
>  GO_CPE_ID_VENDOR = golang
>  
> -HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
> +# Go requires the target toolchain to build the compiler.
> +HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2 toolchain

What happens when we're building host-go for a target architecture that
Go does not support? This was previously supported in host-go, in which
we have this condition:

ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
...
endif

to ensure we build a host-go compiler capable of building code for the
target if the target is supported, but in all cases builds a Go
compiler capable of compiling code for the host. Indeed, host-go might
also be needed solely to build host utilities, which would be relevant
even if the target architecture isn't supported by Go.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
