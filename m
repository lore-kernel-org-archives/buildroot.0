Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC18C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865C34022E;
	Thu,  9 Nov 2023 21:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865C34022E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUXOAsncsw5O; Thu,  9 Nov 2023 21:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC4BC401F5;
	Thu,  9 Nov 2023 21:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4BC401F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 621341BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 398EC4036E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 398EC4036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00jTY6g--MqM for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:29:05 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1273E40018
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1273E40018
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.114]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1My32L-1rKFKU2ynX-00zSeu; Thu, 09 Nov 2023 22:29:01 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 22:28:58 +0100
Message-ID: <20231109212901.5596-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:+GbhRt7c1C7i2ll39SSs5bwnKgmf/t5sNahgyh15awDWKaPbp0Q
 2nBkaEf5D/r7PkD0fZihdsX+BB3ZZw2YO6FOY07cUpJCLYYu09nuQ0Y4E3artohj9n/28kE
 /+aDiyLAtvCZLZpYDyrsW/XzLvRPdHdCeizCuo2yZAQtooaAyxQuVD2rwa1WvCMWOGCeL55
 trO187kmtIfb7u/m4JuxQ==
UI-OutboundReport: notjunk:1;M01:P0:g94AF2cOa7k=;IDEk4FHyoaDUV6LtcGaXwdnW3uc
 /K3dvPy4NlPihL15OvaH4xdx8r4rNhTWVf9TVqNE1MkgUAUhf5ADKddNXA3zur1UtUTS9kTaQ
 SoDHib74ZPhwbudeHBhxrcQXO3d0562ZNBToYMsXD5J/hkTvt2q72SWEl/ztaxn7pNx6iuPEv
 j8TgOXVRxBjqGT/53e3+EMl/sN/7ztHbF9ibqLHIQmNY/MKAyI2isGz0wDAOxzOPVHVe0t/dx
 fY3Z89JLAO3VWnPx5mOl3AU5b5bsH/QS6iua/OE7s4g+r1MRIn5DFd5nohKUBqse7SpPberXd
 m42F46rTTGMS7IETVGsetQwnoM6Li0qyWMaNAl68JvvWBayztQeNz2O78cxGYKRS7n+gnOpI2
 IKaYIosi7SCkD5vSAr/nkTZKirt6nXBCeMXLx6cVltqBVc2R0Sb1lRBi/Dq/zhaGgn6ULXA6N
 VwsWlbF9+2YiekNPsKC6OSFUT+QZg2o6s4Gh/95WIGUzlCAhwct5EUXofT7QOJDSy39PCV8ya
 dWvtAprpbNzW5B3R0/5wTgD6oktvN+Na+vieDEoxdKEqcvc+vyJpDu5cDB40KdXdpgzcXszfk
 PYNyZB/QDVCNHiBCtnmhCGZ2Y/Nk07C5Xeii4dGuMVFz39DHl9CDn2h3SiDUtirMPMC5P31Db
 wLiBri7HJnzGDCdGcTH+lD58IkJnJIW8A+cMJz62YyrFM1V4T+k+s9ObbJcUbUyGHDdRGPSr+
 zDA2m3wgPTtE+9el2TadmabjA2ClbLqHMxxZMq//VzsXVeAQXmT7jzK8CnEaVXS5KiWG5qJt7
 WuFzWjot9rQYf6yYBF7Rih5I8aU1/KX/MQJgNhWa2qEWo23CVtXItaO4xXc6l8MLP2hn6ipIm
 6zbU5Rgmdp6tOR5uprqdAywzFo1BiTj1IHzHuxmTAZBfQp8NmN4WBpFKpnw3SVn8EZsTBpeHq
 7qvXzd3j1GbQGbj+5j7MN4fVFrE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1699565341; x=1700170141; i=ps.report@gmx.net;
 bh=lYBbjkEoWewfsa02E+5G/sWXjsdamcVwIuEkd1sOeOw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=tDeIv7m88Jxw9FSA5s5Vqv/xEld8ZvmUyyw+nh/c0QKgwKU5n4LeYXGucXdgui+h
 /P9ip2Vi2vzT9Z5vq7fjXGtayLbNL5GSeO67zWjiKK3Rf5b9bL8NRBzdD7x/NSLuv
 PQXGeoVo+YGx8lXh2yFrU6gzG9eGAegFWoVUm+v/lxy7SJiq3YwtQg2ysLK1ad7h7
 4z0uzuNueV50CDk5y8X5C7GMusIGoAbzIQ0Jm7CTDDR1EU6WdgXjS6ZKuYHtAFpHk
 wjQz2upmqC0tebBy+oWW0/VixKgp8Tnm93B7GH1JdKOtjPhH5bLzvmOGOxshbRqve
 4nSzqyZt+9CSaOFdGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tDeIv7m8
Subject: [Buildroot] [PATCH v1 1/4] package/libcamera: pipeline option
 'raspberrypi' changed to 'rpi/vc4'
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With upstram commit [1] (since version v0.1.0) the pipeline option 'raspberrypi'
was renamed to 'rpi/vc4'.

Change the buildroot option name from BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
to BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4 (and add Config.in.legacy entry
accordingly) and move handling in Config.in/libcamer.mk to follow alphabetic
ordering.

Fixes:

  .../build/libcamera-v0.1.0/meson.build:3:0: ERROR: Options "raspberrypi" are not in allowed choices: "all, auto, imx8-isi, ipu3, rkisp1, rpi/vc4, simple, uvcvideo, vimc"

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=726e9274ea95fa46352556d340c5793a8da51fcd

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 Config.in.legacy               | 10 ++++++++++
 package/libcamera/Config.in    | 16 ++++++++--------
 package/libcamera/libcamera.mk |  6 +++---
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6fef2318b0..06a40f0b38 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
+	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_USE_WCHAR
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
+	help
+	  Since version ... the libcamera pipeline option 'raspberrypi' was
+	  renamed to 'rpi/vc4'.
+
 config BR2_PACKAGE_OPENJDK_VERSION_11
 	bool "openjdk 11 has been removed"
 	select BR2_LEGACY
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 63c06173db..65d5fb37f8 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -40,21 +40,21 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
 	help
 	  Pipeline for Intel IPU3.
 
-config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
-	bool "raspberrypi pipeline"
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
+	bool "rkisp1 pipeline"
 	depends on BR2_arm || BR2_aarch64
-	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
-	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
-	  Pipeline for Raspberry Pi devices.
+	  Pipeline for Rockchip ISP1.
 
-config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
-	bool "rkisp1 pipeline"
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
+	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
+	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
+	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
-	  Pipeline for Rockchip ISP1.
+	  Pipeline for Raspberry Pi devices.
 
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE
 	bool "simple pipeline"
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8dce67f60f..c1c8bb7b33 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -51,11 +51,11 @@ LIBCAMERA_CONF_OPTS += -Dv4l2=false
 endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
-ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
-LIBCAMERA_PIPELINES-y += raspberrypi
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
+ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
+LIBCAMERA_PIPELINES-y += rpi/vc4
 LIBCAMERA_DEPENDENCIES += boost
 endif
-LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
