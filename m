Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F2CCCA471
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 14:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E9F161187;
	Mon,  6 Oct 2025 14:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei6wfJXSPbXH; Mon,  6 Oct 2025 14:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C5461230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C5461230;
	Mon,  6 Oct 2025 14:40:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BC77909
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 14:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D86141238
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 14:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3ZdMPkkED3Q for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 14:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8F9D41411
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F9D41411
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8F9D41411
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 14:40:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.27.154]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1uOm4A3I1s-00oDqH; Mon, 06
 Oct 2025 16:40:06 +0200
To: buildroot@buildroot.org
Date: Mon,  6 Oct 2025 16:39:47 +0200
Message-ID: <20251006143947.385605-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ydtx5B3qun8WZ2J/okGkWjA1HMdPVv5MW7i9vdUBlCBNV3yqWr6
 q2SUUK2lZuJSaEY2wh07aeARqw6/UqOmFyStvZdXWJ4dFSsnoLGrVwVHGRVGFjAGrdeOnCy
 ALFrervXn9FjkxFi7InPgXLE9gD5IUZ1SiH8kcZ1IpptMTavC5VTZACsKUeqtSg+elwf46A
 mhA0op8Ae3zCsICl+TRMg==
UI-OutboundReport: notjunk:1;M01:P0:KDaYN/ZCDLQ=;38UVC3fK4Ll2wC0pdyW2rXxSixN
 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
 ZTcaWDQHfNayM1kGkJAEf5J3Q69Ytwt9NVomVY
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1759761607; x=1760366407; i=fiona.klute@gmx.de;
 bh=Tc98gjOI0VkoEksMQqMbomCR2VFAzEtmdFLg83qHgHw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lx5WKPMmRfSvAaSzfjKQqQAf5aBdkzptl2M/7Hj2Vb2FeoFBP4KWVUBMJ3KoxSN9
 4vCAuMrJVqsCs26PO0yHkZ+jaAlrKIyHX+JFVyM9tUiH7htBkR5dAZddM/S4YZGfy
 mr+57nFwHzb/f8oF32IjT12OqDkzaQdckoj52rVSbeVHL+nEPNGm19j7WDXObmn0E
 GVokZWSQG99tWAB0hlNIaNjjgCU82hS5z9sTOgFmUhSb838oaq+tCwsRFppOsozTi
 X1IYmIIzVOQxRzydZLT7v2f4s1VmDxkb9d0eslt4s0/LZCYi6Shmz+XJo8Zpgyr9D
 zCH0RlefkY7IanmX/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lx5WKPMm
Subject: [Buildroot] [PATCH 1/1] package/weston: fix DRM backend build with
 libdisplay-info 0.3.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Weston 14.0.2 has a "< 0.3.0" version constraint for the
libdisplay-info dependency. Upstream has relaxed the dependency,
explicitly stating "There are no breaking changes for the high-level
API that Weston uses" [1], but there is no release with the change
yet.

The change had to be backported due to restructuring on upstream
"main" since, where libdisplay-info has become a dependency of Weston
in general, not just the DRM backend.

[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214

Fixes: 1a66cdf7b34328d2b2065bfd22f190c92318e499

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...01-build-Allow-libdisplay-info-0.3.0.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch

diff --git a/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch b/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
new file mode 100644
index 0000000000..d97d1a9bf4
--- /dev/null
+++ b/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
@@ -0,0 +1,37 @@
+From 83b49400c1dfb72e3019267fd03f165d0bffec76 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Mon, 6 Oct 2025 15:20:26 +0200
+Subject: [PATCH] build: Allow libdisplay-info 0.3.0
+
+This is a backport of the change in upstream commit
+683eabb61ec43a270f2e3ed67c63bbe3754b1214 "build: Allow libdisplay-info 0.3.0"
+[1], applying the loosened version limit to the DRM backend only. The dependency
+definition was moved to the top level meson.build in [2], and the lower bound
+increased in [3].
+
+[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214
+[2] https://gitlab.freedesktop.org/wayland/weston/-/commit/76e659f45edd23a8b1b253a93316ec73c709bc71
+[3] https://gitlab.freedesktop.org/wayland/weston/-/commit/82c5b386d860a479ed5a157f4dde58ffe202b948
+
+Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214 (backported)
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ libweston/backend-drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
+index 002669e6..a8f2ea59 100644
+--- a/libweston/backend-drm/meson.build
++++ b/libweston/backend-drm/meson.build
+@@ -4,7 +4,7 @@ endif
+ 
+ dep_libdisplay_info = dependency(
+ 	'libdisplay-info',
+-	version: ['>= 0.1.1', '< 0.3.0'],
++	version: ['>= 0.1.1', '< 0.4.0'],
+ 	fallback: ['display-info', 'di_dep'],
+ 	default_options: [
+ 		'werror=false',
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
