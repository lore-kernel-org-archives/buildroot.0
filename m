Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BBAC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 17:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477FC60E0F;
	Sun, 14 Aug 2022 17:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477FC60E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlVET1tNJSjo; Sun, 14 Aug 2022 17:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B3E460DFA;
	Sun, 14 Aug 2022 17:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B3E460DFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF5E1BF359
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 355EC82923
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355EC82923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdhiVZ2owwlr for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 17:40:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8EB824C1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB8EB824C1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 17:40:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C3C0C60130;
 Sun, 14 Aug 2022 19:39:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 19:39:54 +0200
Date: Sun, 14 Aug 2022 19:39:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814173954.GF2854108@scaer>
References: <20220814084300.2782305-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814084300.2782305-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660498798;
 bh=spE3QeIG7UlvMnsohMJbspzLOZWrFtwhiR+alSNmcrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GcqjUgxwJHhb3d3EXdozeazqn6LN7U93in6kzC35LIKb1E0XFuBMswiIEhGmOTE96
 zAsLDhy618klSFEt0CwCFEamW4mKzS8yAVJjyDNhD+4pUpdIsDd1iheIPYd4GKYOJG
 6VyjuR3PEUblA97jkAX7IDzm3z9CVi8SRPAwwNg8bCC7hBsj1hJNJrlPF+yQbTJpKF
 jaznYtwW8wHPlH693BRYW0RoKWOj6W6GxUdnHvf8HWehtybP7Y/RypgDlK1R+viyTV
 /cCPeYxSJDfjvE6fD2vFhXoHy5eSv5wNQpPJf5lw9n1/sIX8OCA8ymZ1MFJpwCUp/S
 6qCzrGmUwJyAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GcqjUgxw
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: fix libressl build
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-14 10:43 +0200, Fabrice Fontaine spake thusly:
> Fix the following libressl build failure raised since the addition of
> the package in commit 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/11.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: libntp/libntp.a(ntp_random.c.1.o): in function `ntp_RAND_priv_bytes':
> ntp_random.c:(.text+0xac): undefined reference to `RAND_priv_bytes'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a6a825b7f0efc7c82e8ecf792a1f9951ffb047c5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../ntpsec/0003-fix-build-with-libressl.patch | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/ntpsec/0003-fix-build-with-libressl.patch
> 
> diff --git a/package/ntpsec/0003-fix-build-with-libressl.patch b/package/ntpsec/0003-fix-build-with-libressl.patch
> new file mode 100644
> index 0000000000..a5c9543157
> --- /dev/null
> +++ b/package/ntpsec/0003-fix-build-with-libressl.patch
> @@ -0,0 +1,80 @@
> +From 743f16fb3fed9a05e601226f184be236614efe9a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 12 Aug 2022 23:35:52 +0200
> +Subject: [PATCH] fix build with libressl
> +
> +Fix the following build failure with libressl:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/11.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: libntp/libntp.a(ntp_random.c.1.o): in function `ntp_RAND_priv_bytes':
> +ntp_random.c:(.text+0xac): undefined reference to `RAND_priv_bytes'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a6a825b7f0efc7c82e8ecf792a1f9951ffb047c5
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1285]
> +---
> + attic/cmac-timing.c | 2 ++
> + attic/random.c      | 8 ++++++++
> + libntp/ntp_random.c | 2 +-
> + 3 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/attic/cmac-timing.c b/attic/cmac-timing.c
> +index 464daa76b..4f2fd3338 100644
> +--- a/attic/cmac-timing.c
> ++++ b/attic/cmac-timing.c
> +@@ -204,7 +204,9 @@ static void DoPKEY(
> + 		printf("## Oops, EVP_MD_CTX_new() failed.\n");
> + 		return;
> + 	}
> ++#ifdef EVP_MD_CTX_FLAG_FINALISE
> + 	EVP_MD_CTX_set_flags(ctx, EVP_MD_CTX_FLAG_FINALISE);
> ++#endif
> + 
> + 	clock_gettime(CLOCK_MONOTONIC, &start);
> + 	for (int i = 0; i < SAMPLESIZE; i++) {
> +diff --git a/attic/random.c b/attic/random.c
> +index 446c68535..8530ecd25 100644
> +--- a/attic/random.c
> ++++ b/attic/random.c
> +@@ -127,7 +127,11 @@ static int do_avg_priv(unsigned int bytes) {
> + 
> + 	clock_gettime(CLOCK_REALTIME, &start);
> + 	for (int i = 0; i < BATCHSIZE; i++) {
> ++#ifdef LIBRESSL_VERSION_NUMBER
> ++            err += RAND_bytes((unsigned char *)&rnd, bytes);
> ++#else
> +             err += RAND_priv_bytes((unsigned char *)&rnd, bytes);
> ++#endif
> + 	}
> + 	clock_gettime(CLOCK_REALTIME, &stop);
> + 
> +@@ -209,7 +213,11 @@ static int do_fast_priv(unsigned bytes) {
> + 
> + 	for (int i = 0; i < BATCHSIZE; i++) {
> +                 clock_gettime(CLOCK_REALTIME, &start);
> ++#ifdef LIBRESSL_VERSION_NUMBER
> ++                err += RAND_bytes((unsigned char *)&rnd, bytes);
> ++#else
> +                 err += RAND_priv_bytes((unsigned char *)&rnd, bytes);
> ++#endif
> + 		clock_gettime(CLOCK_REALTIME, &stop);
> + 		sec = (stop.tv_sec-start.tv_sec);
> + 		nanos = sec*BILLION + (stop.tv_nsec-start.tv_nsec);
> +diff --git a/libntp/ntp_random.c b/libntp/ntp_random.c
> +index 9304a790d..adb375b24 100644
> +--- a/libntp/ntp_random.c
> ++++ b/libntp/ntp_random.c
> +@@ -29,7 +29,7 @@ void ntp_RAND_bytes(unsigned char *buf, int num) {
> + 
> + void ntp_RAND_priv_bytes(unsigned char *buf, int num) {
> + 	int err;
> +-#if (OPENSSL_VERSION_NUMBER > 0x1010100fL)
> ++#if (OPENSSL_VERSION_NUMBER > 0x1010100fL) && !defined(LIBRESSL_VERSION_NUMBER)
> + 	err = RAND_priv_bytes(buf, num);
> + #else
> + 	err = RAND_bytes(buf, num);
> +-- 
> +2.35.1
> +
> -- 
> 2.35.1
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
