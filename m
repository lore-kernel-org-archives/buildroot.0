Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F237ECDFA1
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFE53812AE;
	Wed, 26 Oct 2022 20:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFE53812AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ki1UuYL3AOg8; Wed, 26 Oct 2022 20:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091B981296;
	Wed, 26 Oct 2022 20:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091B981296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04BF71BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3AA881290
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3AA881290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FglvCldRpjpd for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:10:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B47DE8128C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B47DE8128C
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:10:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BFEE820004;
 Wed, 26 Oct 2022 20:10:29 +0000 (UTC)
Date: Wed, 26 Oct 2022 22:10:28 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221026221028.7e11ea80@windsurf>
In-Reply-To: <20221020141412.346992-3-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-3-tobias@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666815030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6XHVKyY0Xy3hBNEIoU0aEMxZY4CltG6K0qTrCPenMg=;
 b=N2JRgKioS+m4AoJ7kgs5ZnMYX1iUModeFLnAmLH+lZxlTgF4UQwgIrROSOzrdgsyhLo4tm
 bEM4URQAwwYxNQX0/o0p7/WcpzcUDRaCVXHJbak2267mxqYJZCXU+i1OEiCkOgsqtphAgb
 GFXHc+UPudp4jDMAbR2C4AMgmWAM50CSCq0pGFNcpe1lCr6nAe6bgISa2D7XHWLWR+dMUn
 +o7bzvSCKL4HeONR31+AeTZIxNsVeRFdHzhgRMexEfirk6jIgrpmUsdIwyrsrchctOWtEB
 jkBNBTqAg4MNZ7zkZDVXfWrLCxZvzxUDPpkajMg0mlEWLK48OwEsPWkivmNviQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N2JRgKio
Subject: Re: [Buildroot] [PATCH 2/4] package/libbpf: remove architecture
 restrictions
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tobias,

On Thu, 20 Oct 2022 16:14:10 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> Since 3145adfb69ba, libbpf depends on Linux headers >= 4.13. This
> requirement renders the explicit list of supported architectures,
> previously added in f693354c30bd overly restrictive, as the syscall
> number for bpf(2) has been defined since Linux 3.18.
> 
> f693354c30bd was introduced to fix a build issue where a toolchain
> using very old kernel headers (3.13) failed to build libbpf for ARM.
> 
> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
> ---
>  package/libbpf/Config.in | 11 -----------
>  1 file changed, 11 deletions(-)

It is not easy to check if the bpf syscall was indeed wired up in all
architectures we support, but let's assume it's the case as of 4.13 :-)

I have applied, with a slightly improved commit log:

    package/libbpf: remove architecture restrictions
    
    Since Buildroot commit 3145adfb69ba ("package/libbpf: needs headers >=
    4.13"), libbpf depends on Linux headers >= 4.13. This requirement
    renders the explicit list of supported architectures, previously added
    in f693354c30bd overly restrictive, as the syscall number for bpf(2)
    has been defined since Linux 3.18.
    
    Commit f693354c30bd ("package/libbpf: add
    BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS") was introduced to fix a build issue
    where a toolchain using very old kernel headers (3.13) failed to build
    libbpf for ARM, but these architecture dependencies are no longer
    needed due to the bump on the kernel headers version requirement.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
