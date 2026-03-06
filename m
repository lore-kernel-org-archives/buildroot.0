Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2326EFCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E700B41EEA;
	Fri,  6 Mar 2026 19:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoEKkg_pVUJC; Fri,  6 Mar 2026 19:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE79441F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826766;
	bh=RVHPcbXiIUO6tyb5nkBvoSCCVXN/q0YM6G/R03sic8k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=snwnnWE+d8gSjb9Dl0NmvWd1nd35q63C0IyBkMkyCNddmpIlIXSZRj12iB9W9MG6H
	 EhysuykhCUFWsPviA6096CmLtT7TeW/7du+NzDHrTZK7wtSDcn/GmNyLszi6WOs70O
	 ZAcCdeXxFKsHcyyX9EOCG4ocfbZMW1kBwJi4CTfMnwCX013NDcMBuu7Zioyr2RgGv9
	 c4tTFoDCH0RSd0/lAGo2Pl/ivZDONJonXgluu0MMwkmwekSWPBCfj5igP00oUMpsDh
	 8AcbtXxgjNMNfxhr/jyAuMo8DGUN3O/X9FDI7aK/ptLsyAy4mjun0ht9WfLNZtVX+j
	 4fB3ccSCxOYDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE79441F8D;
	Fri,  6 Mar 2026 19:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 027C225B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA4841E56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJe9Moj1UESO for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B267341E84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B267341E84
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C747B7FEE1; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:16:27 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 10945b65772f8c2186dcf4d9e947c787358ad6ab
X-Git-Newrev: 80fff34d7b5e579042f32349e3180b8070214c2c
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.C747B7FEE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/graphicsmagick:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80fff34d7b5e579042f32349e3180b8070214c2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
