Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D1CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E2260B54;
	Sat, 14 May 2022 22:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a0EQdo8-aSP; Sat, 14 May 2022 22:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE3C60B00;
	Sat, 14 May 2022 22:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1D9D1BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0E560B00
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAtHHuj42ZOk for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:03:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EA7860808
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:03:51 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id e15so12387717iob.3
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WuM85s1WgXHIfUonoDIMBL3IkAik4bIY4YTo6QsbIM0=;
 b=iM8zvNumXG/APJKHyi1OD9S4X9Fc+SnnV7tmL7ANmAfrCcQXiAtKdnm/NNWYltySjI
 WnNmBp2+Rf9y6qfu5WFTK8/yzyG5Xcyw0lGw/OxCjdKJQIG6Y4fk4W9vrDv0NDVlyV48
 h21F/0H/4yFsIj+VQRdma1jrfK60b9/jCHvkcury+w9/V0OmNd1og/ZMVuMm6oAhv35V
 ySAXkdrbX3GjQYwH7zhRDG/z/cHrKjrKXLPeBgB7946/PHRsoaP9W2GG8rEIZsWe8d4x
 5xl+zT5O7d9RJEw3S3/N5ZF41uMuD5QvDd9mWO+PUwjNa4j8VoZoSf0fXgZmKZEFHV6b
 dvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WuM85s1WgXHIfUonoDIMBL3IkAik4bIY4YTo6QsbIM0=;
 b=3ND74xpgqMcT13TUCRx2YzV+LcJ3J1KAoCxCr7fbLhBFvYarYstSg1QMbFNLtQV5KQ
 5lY2O3h4SEVAMlDSogNrESsGY/JXHRlek1fj3aKFVk1/LHramAfGTDYhtnGtvTsRujWz
 0ixKftQwnqr9Bn+nlUziqXgD0JF7hL3UEANvsBXSy4kcgNoOVSpuBbz7LyemfrjRu4gx
 ZFpAxO90lyWiVpffCqI8RHC9MtjO7mhzIseqzePvws3JFzOw8gREZsQIfE5UVO5kcxHP
 be6iu5s+uKsyxCzybfS0izYcZ+Cf7lmS/5gxo97rdA4ZOo7ZLimkJSMdEIWV5Q7MRFPe
 IVpQ==
X-Gm-Message-State: AOAM530nS5wdcxVjzio8zgw5ZV4f/a/Zs/ReBJ+Cp4zOiLnh0kCeGoVs
 daN1D8CyRTza/ooqixva11R59eAg7ag=
X-Google-Smtp-Source: ABdhPJxSC2uW9QxzlVR64CjOmKQOP5fQp2RAnKkFww57ijHpr3AqBuNRcHYHlydCEysw55W6Z06kHQ==
X-Received: by 2002:a05:6638:2685:b0:32b:c609:4527 with SMTP id
 o5-20020a056638268500b0032bc6094527mr6063402jat.100.1652565830404; 
 Sat, 14 May 2022 15:03:50 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 m16-20020a026a50000000b0032b3a78175esm1663235jaf.34.2022.05.14.15.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 15:03:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:03:47 -0600
Message-Id: <20220514220347.1288504-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pango: propagate reverse
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It appears some pango reverse dependencies aren't propagated properly.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_PANGO
  Depends on [n]: BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
  Selected by [y]:
  - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in  | 2 ++
 package/gstreamer1/gst1-plugins-base/Config.in | 3 +++
 package/weston/Config.in                       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 669360adb1..209a1c4b1f 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -481,8 +481,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	bool "ttml"
 	depends on BR2_USE_WCHAR # pango -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
+	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 7ca94d7dc4..c7f0e91fa7 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -291,6 +291,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
+	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
+	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 6ad8241caa..babbe214dc 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
 	depends on BR2_USE_WCHAR # pango
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
