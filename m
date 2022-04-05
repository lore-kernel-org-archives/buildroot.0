Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FD7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15C3B40AE6;
	Tue,  5 Apr 2022 19:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cplOTfkmZdwM; Tue,  5 Apr 2022 19:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB7F409FA;
	Tue,  5 Apr 2022 19:51:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78BC41BF21A
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66415405E8
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTPamJ4U4kPa for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 19:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26C58402F3
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 19:51:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so329393wme.0
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 12:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X3tHhQN6Tby7F0Sxy1hQfht/xtKOAOdWAnDnxYliF1Y=;
 b=ZamdxpWdPVqMUS7iblLm2PwctG7hlrgTHenYrBpqU/mxJtgcnMSOqCNOgRIWCmvOld
 EOQU3ikjeVSBl1fr7iDQtnFOQ/QGrEcP+AvS82k/j5nXw7csnZSoSBYlEmF6SxIyAOdJ
 qXejrDFsZTdMHVAJOcUC5KmPG7oWmhmUBHqrJfK6IXZzO9JihBWEcE3EQRbhilm5Gkbj
 AD/eXzLhT5FpKxvMCz8zEVPWYIR+/6Bdhglc5IU473s1jxMosORg7x/DRJKAzgZA1MYh
 ZPSCYFXfSwkya+AKZVpIOMhn9ztLzXXOhwrgRAqK3XRqcDWRljMWpd4c5wz6Evu0ggpn
 60cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X3tHhQN6Tby7F0Sxy1hQfht/xtKOAOdWAnDnxYliF1Y=;
 b=AFkpFBY6IfhyldgN6fNm5FuSoDgzx0SjvlJd7Myk9Tpjgxf5vx3dl31H93LmwTny/X
 9HGVs1XAQt6whTUAWyVcu5FMeaZ19yyfuLcM7xXk3rCEiuUalnuNg4gmx1Scifk9Vvf5
 HseLKP7xG2d6kl6IRP6xHN26iuP7bN+N3wrOVH8yb4U2fp8QwogmJeqj8hxOWo0PtnQg
 yDMCHd4jY6BP/jmuOOHbIUfQh73Xe5oqQsV7sBQB6mAcGEXzKoqsIbnzzAjaKpO1MhTg
 /UWCGDva0NaK2p/6X403vdPiKdg66b4Kl+eHNeSNPPbzz015qgEx5ZfArfFia9BNn8F7
 U9Sg==
X-Gm-Message-State: AOAM531AcuxBjKvsPUejtc4BY5cjt2o4MXEiaIZRTyNYPJYIQB/bFh6H
 NIYsvoQzVsDDQtN+Gp2OmZ0OrIVwoyQ=
X-Google-Smtp-Source: ABdhPJwdqovq8JVSQC39jlFTmIaAldKo5fc3QuUNzlZPgpBlZhdv/Aq+AINMOCRq1JLVu6Ej8VUhog==
X-Received: by 2002:a05:600c:4f96:b0:38e:7dbf:f80b with SMTP id
 n22-20020a05600c4f9600b0038e7dbff80bmr4531069wmq.2.1649188276075; 
 Tue, 05 Apr 2022 12:51:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b0038cafe3d47dsm3385272wmq.42.2022.04.05.12.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 12:51:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 21:49:16 +0200
Message-Id: <20220405194916.1754126-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: needs
 C++
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gst1-plugins-bad needs C++ since switch to meson-package in commit
5d6c408e9535be4b5ba0c8a49215d2d03dcb5cd5:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-8/output-1/host/bin/microblaze-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-8/output-1/host/bin/microblaze-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/8f924cebeb8a1ed73e57103bf3073fb8f8d8752e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-imx/Config.in         | 6 ++++--
 package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++++
 package/gstreamer1/gst1-vaapi/Config.in       | 5 +++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 7b46233b53..41ef8548c5 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -88,11 +88,13 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
 	bool "imxv4l2videosink"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
 	  Elements for V4L2 output
 
-comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+comment "imxv4l2videosink needs a toolchain w/ headers >= 4.2, C++"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 || \
+		!BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 234d57636b..669360adb1 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 	bool "gst1-plugins-bad"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  A set of plug-ins for GStreamer that may be of poor quality
@@ -724,3 +725,6 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 endif
+
+comment "gst1-plugins-bad needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index 91bd4f85dd..ade8b83a5f 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST1_VAAPI
 	bool "gst1-vaapi"
 	depends on !BR2_STATIC_LIBS # dlopen(), libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
@@ -45,6 +46,6 @@ config BR2_PACKAGE_GST1_VAAPI_ENCODERS
 
 endif
 
-comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
+comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library, C++"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_PACKAGE_HAS_UDEV
+		!BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
