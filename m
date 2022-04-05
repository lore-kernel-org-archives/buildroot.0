Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA60C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D377082A7F;
	Tue,  5 Apr 2022 18:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqUrI-BiUf_Z; Tue,  5 Apr 2022 18:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E00E5823AA;
	Tue,  5 Apr 2022 18:11:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE3341BF83E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 18:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC21340916
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 18:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkT9FXaQ9VGr for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 18:11:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6261E40914
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 18:11:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so2134934wms.2
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gqJRMWpF7o8GCnQ/rksXmuilnTSyTgiCsqFHIL1WgIo=;
 b=R6V90uBGvq+5kCf0LPbaITSrPvPyvpnkTLe3MJ26GF52NfomIshErtu8LzrRbNmnrF
 BMBq/t5aUjac7Pn/H7+slDK8iHN6SBpFKHDn5/eCIY2peIXPFMva2agui7j5WZuH8STL
 HOd1huVrL5322aBjDBS3swzDPgPuYansCvhK+ibyUGBtsWBUtxLt7qD/cbgQZB15MC9/
 UIzSNoy2oaskgaZf8j73LRZFgzues1Mw4TLO7tfvvdd4TOzl4QxfLKawuClYKWI7aecS
 beSofIQHHkHdPm6z+TL6SIv0qxqzRcbLeWl7zRJaQj6A+CRhb0s3C4ZIHLZmwNQpEG0y
 wyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gqJRMWpF7o8GCnQ/rksXmuilnTSyTgiCsqFHIL1WgIo=;
 b=ofo//L2wIq9PCklPWZQhV7/E1MxAw48nn0rHaquJlSBReeugV8yLANxf3aB8tMoWkg
 n53n0pkWUvWbM4A6GkUGF976doHeq7pE91uZm1jhf9Sg+Iqats5pELt6v/druj1LYoys
 vVutoex4BhZxLUTX3Q3Y95Qly5/AMnKMPpGMgZHP1azY+3bdkJYvWUeTvb+UIWnd7ek+
 z2CBMKlmjxkpd0s0XIi3UbUp7GyJFJh8jWaU89eL3J2Vo3lKk3iIo7ECf6dbyQml6q2o
 u9jQmg4ZMu/PlEQNJEX+nMgpZs0PJ4VzGAEKvdjStK9rCEn75hqae5BeZSxZmzMDrsKW
 haLw==
X-Gm-Message-State: AOAM532zM9xIUrikooo5XnFk1sVvIiEnPuIMD6OpYxJUmto+ujBVD2Kp
 yb8SBGecW1ZCbsI+mOyvQa1cD+77oos=
X-Google-Smtp-Source: ABdhPJzv1xkL/zB487ttGn3yrthNgLMWykMTl8GkBkhHt5bsNiGGfIDV6H7/qJzXsSsVx9Frx31OKQ==
X-Received: by 2002:a7b:c0c9:0:b0:38e:7d65:6e7f with SMTP id
 s9-20020a7bc0c9000000b0038e7d656e7fmr4085416wmh.168.1649182283257; 
 Tue, 05 Apr 2022 11:11:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c4404000000b0038e6fb9b4fesm2723503wma.48.2022.04.05.11.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 11:11:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 20:09:44 +0200
Message-Id: <20220405180944.946684-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-libav: fix build
 without C++
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

Fix the following build failure without C++ raised since bump to version
1.18.0 in commit 15dc48ca9becafec6ba11b08af18453bc0e40c9e:

The following exception(s) were encountered:
Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-build-on-systems-without-C-compiler.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
new file mode 100644
index 0000000000..6b275220f8
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
@@ -0,0 +1,35 @@
+From 1477eb1fad92ac07cd057b3ecdb04edeeef9edba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 4 Apr 2022 23:32:56 +0200
+Subject: [PATCH] gst-libav: fix build on systems without C++ compiler
+
+Fix the following build failure on systems without C++ compiler:
+
+The following exception(s) were encountered:
+Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2112>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1477eb1fad92ac07cd057b3ecdb04edeeef9edba]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-libav/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fbfa3049afe..7da94b80d59 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('gst-libav', 'c', 'cpp',
++project('gst-libav', 'c',
+   version : '1.20.1',
+   meson_version : '>= 0.60',
+   default_options : [ 'warning_level=1',
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
