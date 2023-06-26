Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E01EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 03:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4C6612D3;
	Mon, 26 Jun 2023 03:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4C6612D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyZehVFXuD38; Mon, 26 Jun 2023 03:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54EA061246;
	Mon, 26 Jun 2023 03:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54EA061246
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDBF1BF397
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 03:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 156A0612D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 03:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 156A0612D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uojgNOLMJXQ0 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 03:02:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7AC60C17
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C7AC60C17
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 03:02:11 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 21ED84402E9;
 Mon, 26 Jun 2023 06:02:01 +0300 (IDT)
References: <20230625203736.1722233-1-peter@korsgaard.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2023 06:00:04 +0300
In-reply-to: <20230625203736.1722233-1-peter@korsgaard.com>
Message-ID: <87jzvr3p01.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1687748521;
 bh=ubaRyBWPYsa1/UmIUC7nGGvdofsfJEPyNSUXczXDCAI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Dlukv7gioAgStc9zgNA8MG9BzS3/q0gMwFfMLFavUVf4CHWMmsXlJ7scdeJxeICWW
 vBvrgfMmZLpDgZavNuKeNxlCfTsN4JZbd5ICDCTGlwb/bCXOtzCUu0QY7zfZITJXZ/
 sPJQmKvuk8xRe3cNXVLWe+v9+H4PtLe19+yn9KB6jnM4IWk4G81OzkdyC3iwlMVPXg
 e4UsZpQIn9KUBX26OQ5/sP7pVPZvBgon9xpZ+wu05RJur+vgCmPH09uuhA/0G4wW/W
 wqy22ii53kIEzuVtk46SXcVBCTDVacVuiJO80MYkGLJRtmNlVPABn+7TgoICoocrLV
 1Bv9zKusTCUIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Dlukv7gi
Subject: Re: [Buildroot] [PATCH] package/tiff: security bump to version 4.5.1
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

Hi Peter,

On Sun, Jun 25 2023, Peter Korsgaard wrote:

> Fixes the following security issues:
>
> - CVE-2023-1916: A flaw was found in tiffcrop, a program distributed by the
>   libtiff package.  A specially crafted tiff file can lead to an
>   out-of-bounds read in the extractImageSection function in
>   tools/tiffcrop.c, resulting in a denial of service and limited information
>   disclosure.  This issue affects libtiff versions 4.x.
>
> - CVE-2023-25434: libtiff 4.5.0 is vulnerable to Buffer Overflow via
>   extractContigSamplesBytes() at /libtiff/tools/tiffcrop.c:3215.
>
> - CVE-2023-26965: loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0
>   has a heap-based use after free via a crafted TIFF image
>
> Drop the now upstream
> 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch.

Should be removed from .checkpackageignore as well.

baruch

>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...rect-simple-copy-paste-error-Fix-488.patch | 28 -------------------
>  package/tiff/tiff.hash                        |  2 +-
>  package/tiff/tiff.mk                          |  5 +---
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
>
> diff --git a/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch b/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
> deleted file mode 100644
> index 73c0d10ffc..0000000000
> --- a/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
> -From: Su Laus <sulau@freenet.de>
> -Date: Sat, 21 Jan 2023 15:58:10 +0000
> -Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
> -
> -[Retrieved from:
> -https://gitlab.com/libtiff/libtiff/-/commit/97d65859bc29ee334012e9c73022d8a8e55ed586]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - tools/tiffcrop.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
> -index 14fa18da..7db69883 100644
> ---- a/tools/tiffcrop.c
> -+++ b/tools/tiffcrop.c
> -@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
> -                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
> -             else
> -             {
> --                prev_cropsize = seg_buffs[0].size;
> -+                prev_cropsize = seg_buffs[i].size;
> -                 if (prev_cropsize < cropsize)
> -                 {
> -                     next_buff = _TIFFrealloc(
> --- 
> -GitLab
> -
> diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
> index 73732892a5..0fa503a02a 100644
> --- a/package/tiff/tiff.hash
> +++ b/package/tiff/tiff.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464  tiff-4.5.0.tar.gz
> +sha256  d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b  tiff-4.5.1.tar.gz
>  sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index f9754a4b49..0006f461a0 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TIFF_VERSION = 4.5.0
> +TIFF_VERSION = 4.5.1
>  TIFF_SITE = http://download.osgeo.org/libtiff
>  TIFF_LICENSE = tiff license
>  TIFF_LICENSE_FILES = LICENSE.md
> @@ -12,9 +12,6 @@ TIFF_CPE_ID_VENDOR = libtiff
>  TIFF_CPE_ID_PRODUCT = libtiff
>  TIFF_INSTALL_STAGING = YES
>  
> -# 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
> -TIFF_IGNORE_CVES += CVE-2022-48281
> -
>  # webp has a (optional) dependency on tiff, so we can't have webp
>  # support in tiff, or that would create a circular dependency.
>  TIFF_CONF_OPTS = \


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
