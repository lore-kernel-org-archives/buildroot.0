Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0D6C10F1E
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7454540492;
	Wed, 14 Dec 2022 18:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7454540492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKL25tKzLHqq; Wed, 14 Dec 2022 18:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914B640144;
	Wed, 14 Dec 2022 18:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 914B640144
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBD5D1BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97DF880BFC
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97DF880BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkWvpVjim7nP for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:59:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F6E280BCE
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F6E280BCE
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 18:59:16 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D2D744409F0;
 Wed, 14 Dec 2022 20:56:05 +0200 (IST)
References: <20221214185030.3340131-1-francois.perrad@gadz.org>
User-agent: mu4e 1.8.10; emacs 27.1
To: Francois Perrad <fperrad@gmail.com>
Date: Wed, 14 Dec 2022 20:57:49 +0200
In-reply-to: <20221214185030.3340131-1-francois.perrad@gadz.org>
Message-ID: <874jtxizgh.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1671044165;
 bh=C3M0t6LTcYy+182QqPZanPy/7hbUOCWLhdiyOetoKRw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=DtMinuBIwlXWN/RdpAJ0CvXKl98qNLe53pNTqX8fy7OOCkGfyZRnPLhUV7aHMtCQX
 CYIO7+UYuB+otIxIIREucEXrtw+0Yu9TrY0UZuLvtodanNxvtAXyazD5UyE7pdUeKG
 Q/aB73is6PosS+BK3lx+ettXj8whI1B7RWARyhDuKTZVdPLFmJt4eIWqQ3LTqMCNZW
 lB7z1u5CYJ5/k6yHkicQLQg2XLcy2xGUrCOw9OwGjf/3a/Me69wHRGUD/KKtKI4WP9
 Idrru4Fx99DbvowQNw+SA7kdn+LdThKdR5CbPliHnfmfnWsTHHhxbbwPqiCWH8FR2z
 UvqXLK2lts3mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=DtMinuBI
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump to version 3.6.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Wed, Dec 14 2022, Francois Perrad wrote:
> remove merged patch

This patch should also remove obsolete LIBARCHIVE_IGNORE_CVES.

baruch

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...chive-Handle-a-calloc-returning-NULL.patch | 38 -------------------
>  package/libarchive/Config.in                  |  2 +-
>  package/libarchive/libarchive.hash            |  2 +-
>  package/libarchive/libarchive.mk              |  2 +-
>  4 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
>
> diff --git a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
> deleted file mode 100644
> index 75ce6112f..000000000
> --- a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
> -From: obiwac <obiwac@gmail.com>
> -Date: Fri, 22 Jul 2022 22:41:10 +0200
> -Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
> -
> -[Retrieved from:
> -https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libarchive/archive_write.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
> -index 66592e826..27626b541 100644
> ---- a/libarchive/archive_write.c
> -+++ b/libarchive/archive_write.c
> -@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
> - 	struct archive_write_filter *f;
> - 
> - 	f = calloc(1, sizeof(*f));
> -+
> -+	if (f == NULL)
> -+		return (NULL);
> -+
> - 	f->archive = _a;
> - 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
> - 	if (a->filter_first == NULL)
> -@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
> - 	a->client_data = client_data;
> - 
> - 	client_filter = __archive_write_allocate_filter(_a);
> -+
> -+	if (client_filter == NULL)
> -+		return (ARCHIVE_FATAL);
> -+
> - 	client_filter->open = archive_write_client_open;
> - 	client_filter->write = archive_write_client_write;
> - 	client_filter->close = archive_write_client_close;
> diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
> index fd429acb6..ffa4cff7b 100644
> --- a/package/libarchive/Config.in
> +++ b/package/libarchive/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBARCHIVE
>  	  Libarchive is a reusable C library for reading and writing a
>  	  variety of streaming archive formats.
>  
> -	  http://www.libarchive.org/
> +	  https://www.libarchive.org/
>  
>  if BR2_PACKAGE_LIBARCHIVE
>  
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index ca580b497..b03bef3de 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,4 +1,4 @@
>  # From https://www.libarchive.de/downloads/sha256sums
> -sha256  5a411aceb978f43e626f0c2d1812ddd8807b645ed892453acabd532376c148e6  libarchive-3.6.1.tar.xz
> +sha256  9e2c1b80d5fbe59b61308fdfab6c79b5021d7ff4ff2489fb12daf0a96a83551d  libarchive-3.6.2.tar.xz
>  # Locally computed:
>  sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 649b7dd4d..00c80bbb6 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.6.1
> +LIBARCHIVE_VERSION = 3.6.2
>  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
