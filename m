Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087FAEE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 09:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B990409A4;
	Mon, 21 Aug 2023 09:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B990409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4uCnsCFs7D2; Mon, 21 Aug 2023 09:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7489E41296;
	Mon, 21 Aug 2023 09:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7489E41296
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51CFC1BF3C0
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 09:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25722610BA
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 09:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25722610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GogJlxxU6hds for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 09:11:22 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBF2610B9
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 09:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBF2610B9
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 304B7440908;
 Mon, 21 Aug 2023 12:10:43 +0300 (IDT)
References: <ZOMoyReghg0Hcu9f@waldemar-brodkorb.de>
User-agent: mu4e 1.9.21; emacs 28.2
To: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 21 Aug 2023 12:10:29 +0300
In-reply-to: <ZOMoyReghg0Hcu9f@waldemar-brodkorb.de>
Message-ID: <87v8d8g3pn.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1692609043;
 bh=2e4By5DpjPGyAizBpg2PE3ieF70SYxxvcowDRzx9vJM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=bPxncY+Bv4tBM0Q3OMAvByUDyjVpkxkDXI/UTlGrI4iv+LKpztCQql/Te10SjFMdt
 1E20/R4nOMpGmgHEQIJuIBUwObeDYwEb/b2NSyifdmxUqYbJR2Zjx1TrGkgYnhZv0y
 On94DZpX0ENMat8SM0Lmnf5zznX8V9/b2aXsMoEwQS8CY4lSGXZ2ulz4xs9rPW95Ji
 zAVTG2pYAUNHR2hOgrWLVvncqJJBFu3VuGck1O+LaFroZjaQH67QKmXANuysto9qNR
 gdkHDBsZAWYsHWhYlJmu/XUQ3GeT8kFGQWMiZs1UmFiTJdCvqfA5NW4up+VhE6FnZN
 8R4Lnqvs3U5+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=bPxncY+B
Subject: Re: [Buildroot] [PATCH] package/file: bump version to 5.45
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

Hi Waldemar,

On Mon, Aug 21 2023, Waldemar Brodkorb wrote:
> Patch is included upstream.
> See here for Changes in 5.45:
> https://mailman.astron.com/pipermail/file/2023-July/001205.html
> See here for Changes in 5.44:
> https://mailman.astron.com/pipermail/file/2022-December/001042.html
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...ile.c-fix-build-without-wide-support.patch | 39 -------------------

You should also remove reference to this patch from .checkpackageignore.

baruch

>  package/file/file.hash                        |  4 +-
>  package/file/file.mk                          |  2 +-
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/file/0001-src-file.c-fix-build-without-wide-support.patch
>
> diff --git a/package/file/0001-src-file.c-fix-build-without-wide-support.patch
> b/package/file/0001-src-file.c-fix-build-without-wide-support.patch
> deleted file mode 100644
> index 29be9fa2cd..0000000000
> --- a/package/file/0001-src-file.c-fix-build-without-wide-support.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From f2ab09d0e1388657f6b7e62bacc383ebea91f5b9 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 26 Oct 2022 00:23:32 +0200
> -Subject: [PATCH] src/file.c: fix build without wide support
> -
> -Fix the following build failure without wide support (e.g. on uclibc)
> -raised since version 5.43 and
> -https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:
> -
> -file.c: In function 'fname_print':
> -file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
> -  605 |    putc(c);
> -      |          ^
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://bugs.astron.com/view.php?id=398]
> ----
> - src/file.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/file.c b/src/file.c
> -index f5f46524..1c23defc 100644
> ---- a/src/file.c
> -+++ b/src/file.c
> -@@ -615,7 +615,7 @@ fname_print(const char *inname)
> - 	for (i = 0; i < n; i++) {
> - 		unsigned char c = CAST(unsigned char, inname[i]);
> - 		if (isprint(c)) {
> --			putc(c);
> -+			putc(c, stdout);
> - 			continue;
> - 		}
> - 		file_octal(c);
> --- 
> -2.35.1
> -
> diff --git a/package/file/file.hash b/package/file/file.hash
> index 49fa9e1e1b..b5a38928fc 100644
> --- a/package/file/file.hash
> +++ b/package/file/file.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated after verifying signature
> -# ftp://ftp.astron.com/pub/file/file-5.43.tar.gz.asc
> +# ftp://ftp.astron.com/pub/file/file-5.45.tar.gz.asc
>  # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
> -sha256  8c8015e91ae0e8d0321d94c78239892ef9dbc70c4ade0008c0e95894abfb1991  file-5.43.tar.gz
> +sha256  fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82  file-5.45.tar.gz
>  sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
>  sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
>  sha256  cc3d8704489d08eaefcaee8c639cc6436c6f0f6b2b03986d3ba7521a1a1d2fc9  src/vasprintf.c
> diff --git a/package/file/file.mk b/package/file/file.mk
> index 9b751e2696..5fc540bc9d 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FILE_VERSION = 5.43
> +FILE_VERSION = 5.45
>  FILE_SITE = ftp://ftp.astron.com/pub/file
>  FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
>  FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
