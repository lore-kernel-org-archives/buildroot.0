Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 22:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD5F60B57;
	Wed, 29 Dec 2021 22:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YyxUbfgQ6P3; Wed, 29 Dec 2021 22:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58B2660B54;
	Wed, 29 Dec 2021 22:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 070FA1BF30B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E97DD81B01
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAuF1YbV4hX4 for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 22:54:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F89B813C5
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 22:54:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s1so47095552wrg.1
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 14:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OeIvY+vV/IVCYQEGy4QrqOIWH3PwcSwj5f48XIbzmA=;
 b=q2YrCCm0BeDdewWmaPs9DrF8ZanI3p4jQBEk5iUj3mPj5v5Q5xUNsDuPDDZXppmUD4
 c7AESaNbMxrnspa4PoYWKCHUvHe9XsdWOfEKGx8d4FFNe5MOavmaBXZGTEWiwOCbPzH+
 AYiT88FWi/wwAfoELP7uxq8Ir1jK1K5IZIXt2hAMR4/zYk9aZ3MrJ/wFshQGToyKA0H4
 diSE2n/4wHDW8/We/rWFadyS4v+XsohhDKSPXGM2ZDi+OFkUykBYMXcUrh3lKHd+XCMW
 zR1K9hB4jeQGWa8GiIIHdh95DoT3k7G0oYztFgGt8N7e+uy8PEkeQYQR3TqFMuWDraVC
 klDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OeIvY+vV/IVCYQEGy4QrqOIWH3PwcSwj5f48XIbzmA=;
 b=Z2LwTS4oYSXbEExYou9CyXqSAU7nWgdzjRsi5ZT0y5wmP8KTaSc092A8u9uS69hZtV
 pUQ1CMt83nRS8cpilK9yq28e+dO1pASA8keb8MrIfoPzhHwXdtHHrlYC/FMUAqIFogja
 tpU9sSsbVQ+2pKyXy0jqpaSPLaLjhnYKcpr9iP9gez5PEIw0vfHRdb8DK2Dk5vf+Rm11
 R0Wi3eqihy4I2TrHPxvtXL+i2GRr65puHEDhyVLlkWjrFeEAoRi0QLWJ83mcv3hw30Rj
 0GIJNSVN3d+R20zsBaiMhKeSjknRDCJw+gX7u2cqaUtKlRrnXeGkfeMV8O+zmxETRYHn
 ovmg==
X-Gm-Message-State: AOAM530PuklVERB8grFXEKl7pZqiCFDaqDsPbN9wWT9KKSstFDMspYxT
 WivlkNt2gUU8lHHTOEoqmAU6ZSeuIUo=
X-Google-Smtp-Source: ABdhPJzxVp3LipjlxavtGJ3gsLlRgGgBw1Dytkytg8n0YnzlJiI9CXonI99zC30cVoKtycLKz+nv2w==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr21505194wro.493.1640818447161; 
 Wed, 29 Dec 2021 14:54:07 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id y8sm24494167wrd.10.2021.12.29.14.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:54:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 23:52:58 +0100
Message-Id: <20211229225258.1124526-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/poppler: fix build without libpng
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libjpeg but without libpng raised
since bump to version 21.12.0 in commit
1da4ead4c2286047228f710d233933dfc04c51f0:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/poppler-21.12.0/poppler/ImageEmbeddingUtils.cc:298:5: error: 'jmp_buf' does not name a type
  298 |     jmp_buf setjmpBuffer;
      |     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/360972af797bb1be80b0324796794817fe0ccf53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch

diff --git a/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch b/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
new file mode 100644
index 0000000000..40af6a2e00
--- /dev/null
+++ b/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
@@ -0,0 +1,27 @@
+From 3ea6bca90d87d3f91556205c4e58ca425c6ac437 Mon Sep 17 00:00:00 2001
+From: Marco Genasci <fedeliallalinea@gmail.com>
+Date: Sun, 12 Dec 2021 10:23:37 +0100
+Subject: [PATCH] Include setjmp.h when WITH_JPEG=yes and WITH_PNG=no
+
+[Retrieved from:
+https://gitlab.freedesktop.org/poppler/poppler/-/commit/3ea6bca90d87d3f91556205c4e58ca425c6ac437]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ poppler/ImageEmbeddingUtils.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/poppler/ImageEmbeddingUtils.cc b/poppler/ImageEmbeddingUtils.cc
+index 5c50f1269..c26b9eb2a 100644
+--- a/poppler/ImageEmbeddingUtils.cc
++++ b/poppler/ImageEmbeddingUtils.cc
+@@ -16,6 +16,7 @@
+ extern "C" {
+ #    include <jpeglib.h>
+ }
++#    include <csetjmp>
+ #endif
+ #ifdef ENABLE_LIBPNG
+ #    include <png.h>
+-- 
+GitLab
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
