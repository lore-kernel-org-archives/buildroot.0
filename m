Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DDEC74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978A3840AD;
	Wed, 29 Mar 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978A3840AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIZid7xgAVGZ; Wed, 29 Mar 2023 21:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC3B84092;
	Wed, 29 Mar 2023 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAC3B84092
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 032291BF966
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF48D41EC6
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF48D41EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZsqFXbLe8CSS for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 21:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559564148A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 559564148A
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 21:00:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MZCfJ-1pv9Xu3kmn-00V99h; Wed, 29 Mar 2023 23:00:03 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 23:00:00 +0200
Message-Id: <20230329210000.7045-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329210000.7045-1-ps.report@gmx.net>
References: <20230329210000.7045-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gSvMSpddEroMulD/+RMtQQuX7Qi05q8vWH008vmvpMcVHiZ2nFP
 MAaNSZOYNEEjyY+hFSbTd7vIyjEcc3ffdLGa3bXMkHDfaQbT+lQJohDSGPfhAs5Lkt1jwHr
 mfNeZuH6p99HlNUNbypk1fTsE2Nc97yAYD+U+FUgTPQVI3rQ9m0fI5DX+0b1JVspozrHgSM
 4rMvVVTTQb4wROniTiMjQ==
UI-OutboundReport: notjunk:1;M01:P0:hOdc7Og6aSE=;7uxLMbtmG5RcbaNr7miaQDLV26a
 uZYKqD+93TRPPSob7VKV8jxbFXbnhMHHsxBECXF8MvE5W5ayc0h9F6m4T1aqtVit4hEK8fdqc
 u8DXgRnKFrXT1NIc8YONlVsm/o2R4VpB7jB5Y9g5V5zvXpDEpb69yPZ8zyRDn+4ZFThJfNU/9
 k74GHa9K2e7sLVUUv8cA1aknCli6G/ZM/yoD1d64Wrgl4x1M5/YeRbyxxICR5c0IdBGLCpvMR
 4qKxGl/xBTb8O53a/miojUAByjcul26vRM6j7aRusFmRkuTBdhNFS0OQAxtQRkELDEamt5t4I
 +L6u5iNSP2yVqFO2Jj7CyegHjoqzZE6tgbUFQt7f4ShZtwXpj+zCNfKJzc2US/e66qoIWb8wX
 nY4LprS6Rl5fLQysIodq7p8wm0+sa+/fNAJhtC9ZKNo8cURZBAomxiBZzoP+UoDpKIIcvBeq+
 PX/lOTvfaw9HKxAKPFqljm850o5k07xZGsybXAwbktp8FV8PxF5Qtj+O+E4tW9ioahyaAqWko
 vzY1pZpMpDwzW/Wi0vV3dbnuBMusXJMUwe0bXo9RV7/RjyMfbN3nQqUodVmmG599bXBJBCLyf
 bmIAuxOWcrzWQmIM1ZAsDF3wCoMLwkmFaeVwxuNRve/vrpekT46g6FNn4vva//1IZXhosJ37T
 VZFeH7tthhv7xmWTmscIbSEx1GxAsn8zAD6P9H89h6yGJpQ6Kkc3ahjL3TZV/Ts7xaCIIkcGo
 qpAtSHzu5/Lq4w0CsmxPILbILmnM277ECoS94mTfcPRrP/OztrQmTj8WJfS8ABc/Am3IrAf9T
 LM4cDEaECmUscianfkGEMsRkXgcojaeoRM324i3ybFu/q4R/ClvuIymC/DAKAWVKCWKAwqGW1
 S/pNZvHDwWvFGGcR7rnBct+RFGyUHgfhT9tE4WF10zaUmJv9/+WLq2mNSSk2UhxRgXyIw+J5q
 /Y0YC8esbaaY8uxBLjJZ7e2WjIs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680123604; i=ps.report@gmx.net;
 bh=Yu1U9SqWW21zX2H/MJl0VHWh6dGs7APs2FYEeD+S4Xo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lryNNFMEDkZsJS3wbmrjLd1M7YUJG8yVaPMyfmsPNju1m2pXfA+bCOhYTvgJdMbFy
 z1xpjZIv11IW2ANx4Z3oqtQI49uq/i5YciCZTopuVKjEX73rWJokm9fUQExbZl12z6
 sEvboB41LzWybVMo8CqZ4PgCui1dOzjoa0XOyycEGPUPREO/m+tcS9Ea/v11dfsjqD
 WjoR8z9UU+NxRPxwwigNhJkVD590CR582okfDZabNZSdukaFEGXV5wBfnuact81B2I
 GWMmGX1U2BMckTj4N8jA/Db39bkw8tFDjCEiEBxP+xLtnxocDMxr7nJkhm/+DkOR9x
 B11h8uIKGltdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lryNNFME
Subject: [Buildroot] [RFC v1 2/2] package/libv4l: enable v4l2-tracer
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Fails with rpi4_64 config:

    CXX      libv4l2tracer_la-libv4l2tracer.lo
  /tmp/ccXMMihl.s: Assembler messages:
  /tmp/ccXMMihl.s:208: Error: symbol `open64' is already defined
  /tmp/ccXMMihl.s:762: Error: symbol `mmap64' is already defined
  make[5]: *** [Makefile:751: libv4l2tracer_la-libv4l2tracer.lo] Error 1

Any hints how to fix this are welcome ;-)
---
 package/libv4l/Config.in | 1 +
 package/libv4l/libv4l.mk | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index c88f280c3b..7a86c7de15 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - v4l2-compliance
 	  - v4l2-ctl, cx18-ctl, ivtv-ctl
 	  - v4l2-sysfs-path
+	  - v4l2-tracer (if json-c is enabled)
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 83f9dfe565..ca2eccc5a6 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -9,7 +9,7 @@ LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l-tracer
+LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
 # needed to get utils/qv4l link flags right
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
@@ -66,6 +66,13 @@ LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
 # libelf and clang support
 LIBV4L_CONF_OPTS += --disable-bpf
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+LIBV4L_CONF_OPTS += --enable-v4l-tracer
+LIBV4L_DEPENDENCIES += json-c
+else
+LIBV4L_CONF_OPTS += --disable-v4l-tracer
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
