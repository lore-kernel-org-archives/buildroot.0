Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F80C001DB
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 15:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589A981F8B;
	Tue, 15 Aug 2023 15:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589A981F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hY1y9meEllTz; Tue, 15 Aug 2023 15:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBAA81F89;
	Tue, 15 Aug 2023 15:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBAA81F89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1CDD1BF475
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA48381F89
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA48381F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spz387HRIoH2 for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 15:50:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEAB681EA7
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEAB681EA7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6587:c204:11b1:7ba6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E277913F86F;
 Tue, 15 Aug 2023 17:50:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Aug 2023 17:50:32 +0200
Date: Tue, 15 Aug 2023 17:50:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230815155032.GE2603@scaer>
References: <ZNr5rFHGHQd11YNe@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNr5rFHGHQd11YNe@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692114635;
 bh=RT6O12/gAUICSs9l+NvhlHECfpl8iYD8WLBfScNPPWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCRUTXHiAZMrv0WhOHOKvxaViopOepA0KdRy+B+xY7fId7TlsLYH2yquFk3iaPya5
 mMe/MAJmMIGuaAxsgjGg8GRJwdDKgjfaUtLMK7JHOM+/UvSSuS4FviYvB/nsBiDcbv
 AC/GKcTv1FSyUHY9Go9ri8WNVh7DlGPJSR18Xenj5gWFFdo+wz0vMzCPZcJ/arDBvl
 15roC0G42uB3wdWGIq1QF1ItQbQfqvQ7LBk4IU2mMMTj0Z5c4wZDe/L4dPYWYeZuap
 1JUIBEryV8VFbLL+PII+pIItY4qLD/rz8AEebFMETVWezhu7AA7MVGnEFL3+2FuUn1
 v3ySs8Q9DSBoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bCRUTXHi
Subject: Re: [Buildroot] [PATCH] package/dmraid: fix compile issue with musl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2023-08-15 06:06 +0200, Waldemar Brodkorb spake thusly:
> Musl removed LFS64 alias of lseek in 1.2.4.
> Tested wth qemu_mips32r6_malta_defconfig.
> 
> No need to backport to older Buildroot releases.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c6f/c6fc3a7f03171cced5a26246d14113c29e641086
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/dmraid/0002-remove-lseek64.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/dmraid/0002-remove-lseek64.patch
> 
> diff --git a/package/dmraid/0002-remove-lseek64.patch b/package/dmraid/0002-remove-lseek64.patch
> new file mode 100644
> index 0000000000..1e6636bf31
> --- /dev/null
> +++ b/package/dmraid/0002-remove-lseek64.patch
> @@ -0,0 +1,19 @@
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: N/A upstream appears dormant

You still need to provide a little blurb to explain the change in the
patch itself.

OTOH, is dmraid still useful nowadays? As you noticed, there hasn't been
any activity since the version we package, 1.0.0.rc16-3, released in
2010, 13 years ago now, and we only did sanitary cleanups since we bumped
in early 2014, almost 10 years ago now. Does it make sense to keep it?

Regards,
Yann E. MORIN.

> +diff -Nur dmraid.orig/1.0.0.rc16-3/dmraid/lib/misc/file.c dmraid/1.0.0.rc16-3/dmraid/lib/misc/file.c
> +--- dmraid.orig/1.0.0.rc16-3/dmraid/lib/misc/file.c	2010-01-11 17:19:29.000000000 +0100
> ++++ dmraid/1.0.0.rc16-3/dmraid/lib/misc/file.c	2023-08-11 13:18:25.762988533 +0200
> +@@ -68,12 +68,7 @@
> + 	if ((fd = open(path, flags, lc->mode)) == -1)
> + 		LOG_ERR(lc, 0, "opening \"%s\"", path);
> + 
> +-#ifdef __KLIBC__
> +-#define	DMRAID_LSEEK	lseek
> +-#else
> +-#define	DMRAID_LSEEK	lseek64
> +-#endif
> +-	if (offset && (o = DMRAID_LSEEK(fd, offset, SEEK_SET)) == (loff_t) - 1)
> ++	if (offset && (o = lseek(fd, offset, SEEK_SET)) == (loff_t) - 1)
> + 		log_err(lc, "%s: seeking device \"%s\" to %" PRIu64,
> + 			who, path, offset);
> + 	else if (rw->func(fd, buffer, size) != size)
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
