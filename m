Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63216C369D7
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E96FB60693;
	Wed, 23 Apr 2025 19:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxGoRZV1rZmF; Wed, 23 Apr 2025 19:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D38126077A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D38126077A;
	Wed, 23 Apr 2025 19:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B37119F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3155960693
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuLJeQzQF4o0 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D254C6077A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D254C6077A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D254C6077A
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:06:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 532C343D79;
 Wed, 23 Apr 2025 19:06:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1u7fQj-00EnKj-2W;
 Wed, 23 Apr 2025 21:06:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 21:06:43 +0200
Message-Id: <20250423190643.3526208-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423190643.3526208-1-peter@korsgaard.com>
References: <20250423190643.3526208-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -104
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqgedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeggfejieejgfelleevheeuudegheeitdeuuddvvdehleejiefggeekhffgieenucffohhmrghinhepnhhishhtrdhgohhvpdhhvghpthgrphhougdrnhgvthenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepghhriigvghhorhiisegslhgrtghhrdhplh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] package/graphicsmagick: add post-1.3.45
 security fixes
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-27795: ReadJXLImage in JXL in GraphicsMagick before 1.3.46 lacks
  image dimension resource limits
  https://nvd.nist.gov/vuln/detail/CVE-2025-27795

- CVE-2025-32460: GraphicsMagick before 8e56520 has a heap-based buffer
  over-read in ReadJXLImage in coders/jxl.c, related to an
  ImportViewPixelArea call.
  https://nvd.nist.gov/vuln/detail/CVE-2025-32460

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pply-image-dimension-resource-limits.patch | 32 ++++++++++
 ...ixel_format-num_channels-needs-to-be.patch | 60 +++++++++++++++++++
 package/graphicsmagick/graphicsmagick.mk      |  6 ++
 3 files changed, 98 insertions(+)
 create mode 100644 package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 create mode 100644 package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch

diff --git a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
new file mode 100644
index 0000000000..275738a71a
--- /dev/null
+++ b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
@@ -0,0 +1,32 @@
+# HG changeset patch
+# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
+# Date 1725886903 18000
+#      Mon Sep 09 08:01:43 2024 -0500
+# Node ID 9bbae7314e3c3b19b830591010ed90bb136b9c42
+# Parent  db3ff8d00c28c38895e1600a28706ce251dac570
+ReadJXLImage(): Apply image dimension resource limits. Addresses oss-fuzz Issue 69728
+
+Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop ChangeLog/version changes]
+diff --git a/coders/jxl.c b/coders/jxl.c
+--- a/coders/jxl.c
++++ b/coders/jxl.c
+@@ -571,6 +571,7 @@
+                                       basic_info.alpha_bits, basic_info.num_color_channels,
+                                       basic_info.have_animation == JXL_FALSE ? "False" : "True");
+               }
++
+             if (basic_info.num_extra_channels)
+               {
+                 size_t index;
+@@ -637,6 +638,9 @@
+ 
+             image->orientation=convert_orientation(basic_info.orientation);
+ 
++            if (CheckImagePixelLimits(image, exception) != MagickPass)
++              ThrowJXLReaderException(ResourceLimitError,ImagePixelLimitExceeded,image);
++
+             pixel_format.endianness=JXL_NATIVE_ENDIAN;
+             pixel_format.align=0;
+             if (basic_info.num_color_channels == 1)
diff --git a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
new file mode 100644
index 0000000000..d1cc795b4c
--- /dev/null
+++ b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
@@ -0,0 +1,60 @@
+# HG changeset patch
+# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
+# Date 1743004970 18000
+#      Wed Mar 26 11:02:50 2025 -0500
+# Node ID 8e56520435df50f618a03f2721a39a70a515f1cb
+# Parent  036a1376a2a6dc9504c5148249cbd8feaef72de6
+ReadJXLImage(): pixel_format.num_channels needs to be 2 for grayscale matte.
+
+Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop ChangeLog/version changes]
+
+diff --git a/coders/jxl.c b/coders/jxl.c
+--- a/coders/jxl.c
++++ b/coders/jxl.c
+@@ -658,7 +658,7 @@
+                       ThrowJXLReaderException(ResourceLimitError,MemoryAllocationFailed,image);
+                   }
+                 grayscale=MagickTrue;
+-                pixel_format.num_channels=1;
++                pixel_format.num_channels=image->matte ? 2 : 1;
+                 pixel_format.data_type=(basic_info.bits_per_sample <= 8 ? JXL_TYPE_UINT8 :
+                                         (basic_info.bits_per_sample <= 16 ? JXL_TYPE_UINT16 :
+                                          JXL_TYPE_FLOAT));
+@@ -843,6 +843,24 @@
+             size_t
+               out_len;
+ 
++            if (image->logging)
++              (void) LogMagickEvent(CoderEvent,GetMagickModule(),
++                                    "JxlPixelFormat:\n"
++                                    "    num_channels: %u\n"
++                                    "    data_type: %s\n"
++                                    "    endianness: %s\n"
++                                    "    align: %" MAGICK_SIZE_T_F "u",
++                                    pixel_format.num_channels,
++                                    pixel_format.data_type == JXL_TYPE_FLOAT ? "float" :
++                                    (pixel_format.data_type == JXL_TYPE_UINT8 ? "uint8" :
++                                     (pixel_format.data_type == JXL_TYPE_UINT16 ? "uint16" :
++                                      (pixel_format.data_type == JXL_TYPE_FLOAT16 ? "float16" :
++                                       "unknown"))) ,
++                                    pixel_format.endianness == JXL_NATIVE_ENDIAN ? "native" :
++                                    (pixel_format.endianness == JXL_LITTLE_ENDIAN ? "little" :
++                                     (pixel_format.endianness == JXL_BIG_ENDIAN ? "big" : "unknown")),
++                                    pixel_format.align);
++
+             status=JxlDecoderImageOutBufferSize(jxl_decoder,&pixel_format,&out_len);
+             if (status != JXL_DEC_SUCCESS)
+               {
+@@ -852,6 +870,10 @@
+                 break;
+               }
+ 
++            if (image->logging)
++              (void) LogMagickEvent(CoderEvent,GetMagickModule(),
++                                    "JxlDecoderImageOutBufferSize() returns %" MAGICK_SIZE_T_F "u",
++                                    (MAGICK_SIZE_T) out_len);
+             out_buf=MagickAllocateResourceLimitedArray(unsigned char *,out_len,sizeof(*out_buf));
+             if (out_buf == (unsigned char *) NULL)
+               ThrowJXLReaderException(ResourceLimitError,MemoryAllocationFailed,image);
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index baaa9bcb02..4b9f3bd23c 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -11,6 +11,12 @@ GRAPHICSMAGICK_LICENSE = MIT
 GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
 GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 
+# 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
+
+# 0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-32460
+
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
