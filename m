Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B516FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4BE41EED;
	Fri,  6 Mar 2026 19:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHZMbJBTBUgJ; Fri,  6 Mar 2026 19:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21CD841EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826684;
	bh=bAMiFp/psfu6QTyuLPSNZDBnxPBCS8xt9TCorogLfOg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MCgfE3VrARsXUUEO1sHRKR5eOIFow1RMXR9t5uNeVKl7YwL9BEl7spsZY5Ciy+AmO
	 XrxmoGEJHxK1elp38lka+ul67V9ln9d3e0qz78cq4ji6JWMI0YLTDgfJVtdq2B/P0f
	 Lnt8eSX8QQ5G4LuXEx7EeTLKDWUz3RzP5Okah1tAB5wqV6QPFGMvsOfn2kJfk2n5mR
	 1xehRtJLrWRMXNxTf48agmlDmzg2vGKzlFpsB3DI94C+i/oXsfRPwwcBhmFpvFeSL5
	 Wq+MJfX48lqwIfxpcrMcRM9e0TA1uNByzQ4ga/prdpJ73zhnficGPRrwAa6ysMf8rk
	 r4w+086KMwnow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21CD841EEA;
	Fri,  6 Mar 2026 19:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E850223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE8C613E3
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHmpM1OyEMuj for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68466613F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68466613F3
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DB51855F0; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:16:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 44c0deba937fc42181caaf37a83dd9f2916117cc
X-Git-Newrev: ea8df0a72a745194e9693ba54385e6056a90a75b
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.7DB51855F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/graphicsmagick:
 add patch for CVE-2025-27796
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea8df0a72a745194e9693ba54385e6056a90a75b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes the following vulnerability:

- CVE-2025-27796:
    ReadWPGImage in WPG in GraphicsMagick before 1.3.46 mishandles palette
    buffer allocation, resulting in out-of-bounds access to heap memory in
    ReadBlob.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2025-27796
  - https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6f9f9caa4516be5ca291c8da834710fe7cd0dc23)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-buffer-is-allocated-and-the-current-size.patch | 55 ++++++++++++++++++++++
 package/graphicsmagick/graphicsmagick.mk           |  3 ++
 2 files changed, 58 insertions(+)

diff --git a/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch b/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
new file mode 100644
index 0000000000..8a98034833
--- /dev/null
+++ b/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
@@ -0,0 +1,55 @@
+# HG changeset patch
+# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
+# Date 1734634653 21600
+#      Thu Dec 19 12:57:33 2024 -0600
+# Node ID 883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
+# Parent  cf7cd5ebabb0ca40204de7539f4fb9ae02121958
+ReadWPGImage(): Assure that palette buffer is allocated and the current size.
+
+CVE: CVE-2025-27796
+Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
+[thomas: remove changelog and binary]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/coders/wpg.c b/coders/wpg.c
+--- a/coders/wpg.c
++++ b/coders/wpg.c
+@@ -1704,28 +1704,23 @@
+                 ThrowReaderException(CorruptImageError,InvalidColormapIndex,image);
+               }
+ 
+-              if(pPalette!=NULL &&
+-                 PaletteAllocBytes < 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries))
+-              {
+-                MagickFreeResourceLimitedMemory(pPalette);
+-                PaletteAllocBytes = 0;
+-              }
++              /* Assure that buffer is allocated and the current size */
++              if (PaletteAllocBytes != Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256))
++                {
++                  PaletteAllocBytes = Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256);
++                  MagickReallocateResourceLimitedMemory(unsigned char *,pPalette,PaletteAllocBytes);
++                }
+               if(pPalette==NULL)
+-              {
+-                PaletteItems = WPG_Palette.NumOfEntries;
+-                PaletteAllocBytes = 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries);
+-                if(PaletteAllocBytes < 4*256) PaletteAllocBytes = 4*256;
+-                pPalette = MagickAllocateResourceLimitedMemory(unsigned char *,(size_t)PaletteAllocBytes);
+-                if(pPalette==NULL)
+-                    ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
+-                for(i=0; i<=255; i++)
++                ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
++
++              PaletteItems = WPG_Palette.NumOfEntries;
++              for(i=0; i<=255; i++)
+                 {
+                   pPalette[4*i] = WPG1_Palette[i].Red;
+                   pPalette[4*i+1] = WPG1_Palette[i].Green;
+                   pPalette[4*i+2] = WPG1_Palette[i].Blue;
+                   pPalette[4*i+3] = OpaqueOpacity;
+                 }
+-              }
+               if(ReadBlob(image,(size_t) PaletteItems*4,pPalette+((size_t)4*WPG_Palette.StartIndex)) != (size_t) PaletteItems*4)
+               {
+                 MagickFreeResourceLimitedMemory(pPalette);
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 6c2885b7d8..e329e51b70 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -26,6 +26,9 @@ GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 # 0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-32460
 
+# 0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27796
+
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
