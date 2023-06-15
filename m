Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026A5EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 18:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0CA6146F;
	Thu, 15 Jun 2023 18:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E0CA6146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvjDAV9V2GfT; Thu, 15 Jun 2023 18:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DF96146B;
	Thu, 15 Jun 2023 18:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DF96146B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6925B1BF293
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 18:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 428FE61469
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 18:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428FE61469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mgVyZERcBSj for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 18:06:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 990B161468
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 990B161468
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 18:06:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcb3.dip0.t-ipconnect.de [84.161.188.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04658A4C043B
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 20:06:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47208)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1q9rMI-000321-2L
 for buildroot@buildroot.org; Thu, 15 Jun 2023 20:06:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 20:06:10 +0200
Message-Id: <20230615180610.625793-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1686852371;
 bh=qGBOB5St8ay9Sy/MWWvL48SIDshLOfVb1V8a1xaR2Cw=;
 h=From:To:Subject:Date:From;
 b=lUI4heFmKOp5mFHo0LZMkl3GF6Kwlgo0vnwoKroWKOSIyESurPlZe/P+pP/w+w5ww
 E0q2gOJirhY7NciPeES6G99Q0ZLyh/3Lzno6q8qWE4t1HpH4ShAgO9vQt7kcEmlptT
 hYH/D6gHpiNynfgnTBvbIGqvCgY9T8HNHGkrBRTBNobV+Zd3k9O3ULyIQU5Sue1jLS
 GzNsGOz2BVmf7gunJOoJds9phpqfsclRNxhx5uMOWyEHikEH6OpCgP/AqHrGhdArKE
 8sGKmGvJzCEMabXmFpINGBbU+5xR7f+9aD7s2rCyQPwSotoRTjUhq2vLkVPpfRz877
 MupkGbiVECTIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lUI4heFm
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: security bump
 version to 1.8.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-3138:
https://lists.x.org/archives/xorg-announce/2023-June/003406.html

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003407.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 4fbec783d6..f443d947a4 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003398.html
-sha256  e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561  libX11-1.8.5.tar.xz
-sha512  5274f6073ead119c8f915d302f1e2bf9579f88d28a2a2d084a4be2050b14fb605efe91099c89ba55aeb7ad36ae0ecbd519b0808be0e29f56367d5dd8faa063d3  libX11-1.8.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-June/003407.html
+sha256  59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9  libX11-1.8.6.tar.xz
+sha512  b94a578003078a42cea43d80fae2c54a3aaa30f706088bb3546331e9abfc180131cafb37887117abcc5b6116992e299974981eef96ecfcf883cc8a1aba4d1ade  libX11-1.8.6.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 5177e3a1e0..75199f1a3d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.5
+XLIB_LIBX11_VERSION = 1.8.6
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
