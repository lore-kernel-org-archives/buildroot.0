Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB85EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A260E40515;
	Wed,  4 Mar 2026 21:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ypo--ZbZnlO2; Wed,  4 Mar 2026 21:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9901A4052F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660829;
	bh=EWYMPibb9lbS2mmhuzYh6qaCvbUkBodJEnhtwtdoKO4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sz6RKjI6Wo3aFhLAEjRq6nwzm8TfhQVSXR7HDcpm3kissg3BOHd4FkDT02nkC+jmm
	 td1lEtEFq+H+BYsYOWL/BSSYwJ7uAnbxkf3/ETEeIWCY1I7Yg9AG0k3eGXZvjRtwPV
	 W0kdqSNPwlYgfKwas9jGzISwuNGNNBJwcVJCbplxit+Dkh7Gl5qieD7xvyk1v5y1R/
	 YMVOMhIx9eCl+Yt+jlt/JC7ayjDH2MIPoTZfzYw+gaq6LJP/Dm/ovADheDAP1oyfpB
	 0EfdAUIOhfxoq6mnRQB6/wudtB37HU5sv3qSpeAOPhxkJSN4tNPFEBvqbSsZp9RYVW
	 WdTLv7Yf0nQeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9901A4052F;
	Wed,  4 Mar 2026 21:47:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 572C9223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A8B4064F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMsqWVAg3kDb for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A31D4064C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A31D4064C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:47:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52FE38625E; Wed,  4 Mar 2026 21:47:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:42:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d225a6ffad8d1b1a40976f9c49a04d5db33e0c47
X-Git-Newrev: 746519df52a459708b4eef8cee8992c9af933ca8
X-Patchwork-Hint: ignore
Message-Id: <20260304214707.52FE38625E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: bump to v1.3.46
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/746519df52a459708b4eef8cee8992c9af933ca8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information, see the release note:

- http://www.graphicsmagick.org/NEWS.html#october-29-2025
- https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/compare/GraphicsMagick-1_3_45...GraphicsMagick-1_3_46

This release include now upstream fixes for CVE-2025-27795,
CVE-2025-32460, CVE-2025-27796.

Copyright year updated in [1].

[1] https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/13454c83b42327a29796b2bf418e4f90f5fc9292

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...age-Apply-image-dimension-resource-limits.patch | 33 ------------
 ...age-pixel_format-num_channels-needs-to-be.patch | 61 ----------------------
 ...-buffer-is-allocated-and-the-current-size.patch | 55 -------------------
 package/graphicsmagick/graphicsmagick.hash         |  4 +-
 package/graphicsmagick/graphicsmagick.mk           | 11 +---
 5 files changed, 3 insertions(+), 161 deletions(-)

diff --git a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
deleted file mode 100644
index 56122e466e..0000000000
--- a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1725886903 18000
-#      Mon Sep 09 08:01:43 2024 -0500
-# Node ID 9bbae7314e3c3b19b830591010ed90bb136b9c42
-# Parent  db3ff8d00c28c38895e1600a28706ce251dac570
-ReadJXLImage(): Apply image dimension resource limits. Addresses oss-fuzz Issue 69728
-
-CVE: CVE-2025-27795
-Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: drop ChangeLog/version changes]
-diff --git a/coders/jxl.c b/coders/jxl.c
---- a/coders/jxl.c
-+++ b/coders/jxl.c
-@@ -571,6 +571,7 @@
-                                       basic_info.alpha_bits, basic_info.num_color_channels,
-                                       basic_info.have_animation == JXL_FALSE ? "False" : "True");
-               }
-+
-             if (basic_info.num_extra_channels)
-               {
-                 size_t index;
-@@ -637,6 +638,9 @@
- 
-             image->orientation=convert_orientation(basic_info.orientation);
- 
-+            if (CheckImagePixelLimits(image, exception) != MagickPass)
-+              ThrowJXLReaderException(ResourceLimitError,ImagePixelLimitExceeded,image);
-+
-             pixel_format.endianness=JXL_NATIVE_ENDIAN;
-             pixel_format.align=0;
-             if (basic_info.num_color_channels == 1)
diff --git a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
deleted file mode 100644
index 004594523c..0000000000
--- a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1743004970 18000
-#      Wed Mar 26 11:02:50 2025 -0500
-# Node ID 8e56520435df50f618a03f2721a39a70a515f1cb
-# Parent  036a1376a2a6dc9504c5148249cbd8feaef72de6
-ReadJXLImage(): pixel_format.num_channels needs to be 2 for grayscale matte.
-
-CVE: CVE-2025-32460
-Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: drop ChangeLog/version changes]
-
-diff --git a/coders/jxl.c b/coders/jxl.c
---- a/coders/jxl.c
-+++ b/coders/jxl.c
-@@ -658,7 +658,7 @@
-                       ThrowJXLReaderException(ResourceLimitError,MemoryAllocationFailed,image);
-                   }
-                 grayscale=MagickTrue;
--                pixel_format.num_channels=1;
-+                pixel_format.num_channels=image->matte ? 2 : 1;
-                 pixel_format.data_type=(basic_info.bits_per_sample <= 8 ? JXL_TYPE_UINT8 :
-                                         (basic_info.bits_per_sample <= 16 ? JXL_TYPE_UINT16 :
-                                          JXL_TYPE_FLOAT));
-@@ -843,6 +843,24 @@
-             size_t
-               out_len;
- 
-+            if (image->logging)
-+              (void) LogMagickEvent(CoderEvent,GetMagickModule(),
-+                                    "JxlPixelFormat:\n"
-+                                    "    num_channels: %u\n"
-+                                    "    data_type: %s\n"
-+                                    "    endianness: %s\n"
-+                                    "    align: %" MAGICK_SIZE_T_F "u",
-+                                    pixel_format.num_channels,
-+                                    pixel_format.data_type == JXL_TYPE_FLOAT ? "float" :
-+                                    (pixel_format.data_type == JXL_TYPE_UINT8 ? "uint8" :
-+                                     (pixel_format.data_type == JXL_TYPE_UINT16 ? "uint16" :
-+                                      (pixel_format.data_type == JXL_TYPE_FLOAT16 ? "float16" :
-+                                       "unknown"))) ,
-+                                    pixel_format.endianness == JXL_NATIVE_ENDIAN ? "native" :
-+                                    (pixel_format.endianness == JXL_LITTLE_ENDIAN ? "little" :
-+                                     (pixel_format.endianness == JXL_BIG_ENDIAN ? "big" : "unknown")),
-+                                    pixel_format.align);
-+
-             status=JxlDecoderImageOutBufferSize(jxl_decoder,&pixel_format,&out_len);
-             if (status != JXL_DEC_SUCCESS)
-               {
-@@ -852,6 +870,10 @@
-                 break;
-               }
- 
-+            if (image->logging)
-+              (void) LogMagickEvent(CoderEvent,GetMagickModule(),
-+                                    "JxlDecoderImageOutBufferSize() returns %" MAGICK_SIZE_T_F "u",
-+                                    (MAGICK_SIZE_T) out_len);
-             out_buf=MagickAllocateResourceLimitedArray(unsigned char *,out_len,sizeof(*out_buf));
-             if (out_buf == (unsigned char *) NULL)
-               ThrowJXLReaderException(ResourceLimitError,MemoryAllocationFailed,image);
diff --git a/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch b/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
deleted file mode 100644
index 8a98034833..0000000000
--- a/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1734634653 21600
-#      Thu Dec 19 12:57:33 2024 -0600
-# Node ID 883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
-# Parent  cf7cd5ebabb0ca40204de7539f4fb9ae02121958
-ReadWPGImage(): Assure that palette buffer is allocated and the current size.
-
-CVE: CVE-2025-27796
-Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
-[thomas: remove changelog and binary]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-
-diff --git a/coders/wpg.c b/coders/wpg.c
---- a/coders/wpg.c
-+++ b/coders/wpg.c
-@@ -1704,28 +1704,23 @@
-                 ThrowReaderException(CorruptImageError,InvalidColormapIndex,image);
-               }
- 
--              if(pPalette!=NULL &&
--                 PaletteAllocBytes < 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries))
--              {
--                MagickFreeResourceLimitedMemory(pPalette);
--                PaletteAllocBytes = 0;
--              }
-+              /* Assure that buffer is allocated and the current size */
-+              if (PaletteAllocBytes != Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256))
-+                {
-+                  PaletteAllocBytes = Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256);
-+                  MagickReallocateResourceLimitedMemory(unsigned char *,pPalette,PaletteAllocBytes);
-+                }
-               if(pPalette==NULL)
--              {
--                PaletteItems = WPG_Palette.NumOfEntries;
--                PaletteAllocBytes = 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries);
--                if(PaletteAllocBytes < 4*256) PaletteAllocBytes = 4*256;
--                pPalette = MagickAllocateResourceLimitedMemory(unsigned char *,(size_t)PaletteAllocBytes);
--                if(pPalette==NULL)
--                    ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
--                for(i=0; i<=255; i++)
-+                ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
-+
-+              PaletteItems = WPG_Palette.NumOfEntries;
-+              for(i=0; i<=255; i++)
-                 {
-                   pPalette[4*i] = WPG1_Palette[i].Red;
-                   pPalette[4*i+1] = WPG1_Palette[i].Green;
-                   pPalette[4*i+2] = WPG1_Palette[i].Blue;
-                   pPalette[4*i+3] = OpaqueOpacity;
-                 }
--              }
-               if(ReadBlob(image,(size_t) PaletteItems*4,pPalette+((size_t)4*WPG_Palette.StartIndex)) != (size_t) PaletteItems*4)
-               {
-                 MagickFreeResourceLimitedMemory(pPalette);
diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index 044214c8fc..0a2e926c3f 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dcea5167414f7c805557de2d7a47a9b3147bcbf617b91f5f0f4afe5e6543026b  GraphicsMagick-1.3.45.tar.xz
-sha256  27d121f97ad71ff506ac5a6a9539e969154f3a66f3da24fd5b6f268acd106295  Copyright.txt
+sha256  c7c706a505e9c6c3764156bb94a0c9644d79131785df15a89c9f8721d1abd061  GraphicsMagick-1.3.46.tar.xz
+sha256  a610fd86484bf7c80b53f84f9644995c25c74f1dd711f16d2608bbe81176d18b  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index e329e51b70..0b7875b5cc 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.45
+GRAPHICSMAGICK_VERSION = 1.3.46
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
@@ -20,15 +20,6 @@ GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
 # https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2007-0770
 
-# 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
-
-# 0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-32460
-
-# 0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27796
-
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
