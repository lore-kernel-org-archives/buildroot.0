Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A45CC001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C810A40BF1;
	Tue,  8 Aug 2023 17:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C810A40BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_W7CsN5I1Ge; Tue,  8 Aug 2023 17:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07D54405AA;
	Tue,  8 Aug 2023 17:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D54405AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3381BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3E960BF8
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3E960BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfj7kmklevQC for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:29:11 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B656360B27
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B656360B27
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5C4E1BF205;
 Tue,  8 Aug 2023 17:29:07 +0000 (UTC)
Date: Tue, 8 Aug 2023 19:29:06 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230808192906.1a6c6871@windsurf>
In-Reply-To: <20230724011811.434148-1-christian@aperture.us>
References: <20230724011811.434148-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691515748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQoBkvj1lbdQcxfJx3Nx3hvNLKZevDo7xpkoCw6bx5Q=;
 b=L2J+eMYyhPnJb2iZDtlJAX4/usPttfMXxp9RvllZuenMadLIjtTtoD29zzS0ytVN7+gCc3
 mItQFXcBBS8frpuZzZsl5iU9h+TtFYIBpk3D6tJDLJO0EJM/ALN9QKWcF/9PQUtGZQDxyC
 UpaZ46PN2hsZIw88HmDqIXzLJVpIlwOYp9+EES4EXiusEifXv/arTuwg4Q03kqoeoEKibp
 z8C3lu71GwwkNkNtI8aGPP0W8Vserm9eYo9lsTF1HuhpTsmJf1ElhkmF5IDC1oUFEscpz/
 yuSS32HDCrUB0KN+qZ2igAbPwhFv/LSotB1C5u0aLofHdJNur1QsXC3dhJCLrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L2J+eMYy
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go-bootstrap-stage2: bump
 version to 1.19.11
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jul 2023 18:18:11 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> While it's not strictly necessary to update go-bootstrap-stage2, we can
> continue to update the package to the latest 1.19.x until Go 1.19.x is
> discontinued, at which point we can leave it at the final 1.19.x
> version.
> 
> This package is only used when bootstrapping host-go.
> 
> go1.19.11 includes a security fix to the net/http package, as well as
> bug fixes to cgo, the cover tool, the go command, the runtime, and the
> go/printer package.
> 
> https://go.dev/doc/devel/release#go1.19.minor
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 3 ++-
>  package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> index 874737ea2d..a698adaa23 100644
> --- a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> +++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> @@ -1,3 +1,4 @@
>  # From https://go.dev/dl
> -sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
> +sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> +

Addition of a useless empty newline here causing a check-package
warning.

Fixed that, and applied to master. I've applied to master because it's
a low-risk update, with a security fix inside, even though admittedly
go-bootstrap-stage2 doesn't go on the target.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
