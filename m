Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F03E8382D
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 480AB60A65;
	Mon, 16 Feb 2026 20:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tI2xrlVvH00Q; Mon, 16 Feb 2026 20:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2812460AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771273148;
	bh=oBl+S5ELTobtsNvikgo8ohA7yf8As/bL2Ta98m23j98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=koEjbNDuQIhQnuBiDibckrHARNtQqLg2qARuV7hd0D4QflvurusAFipM5q1qM3gdu
	 fbC/4uVGHIOOZHqf+8YnrC16JOsNYpjedvsJYU12O3ewMlucp6kZB2FYU4EiaRxUxT
	 7Q3YtHtkrSbe3sN3Gv0saOb/q5zqAbsphUZwC2TW+GttxBchCQNnbvWhdjNnAR70qv
	 4AtyHeffMVJav+F3KvzSgHF+N/FfdIus/pUE6FnXY0vUViXNips7dnXOaAN9Lmn3v7
	 GYzt+AnkrF8qtwQLkByFN9mX+NMSIhxZSAlcmv2V43DF0OZYih0St0fN/p00IcEMAf
	 gosMElP4Ub7hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2812460AC7;
	Mon, 16 Feb 2026 20:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E82241EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D6360AC7
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLYCvQ-wBOXb for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 20:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A1C60A65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07A1C60A65
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:19:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCF4086F39; Mon, 16 Feb 2026 20:19:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 20:50:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e78a710e8fefaf722d45d8031e542be5c5718e0e
X-Git-Newrev: 31d58806d8113eba4f0cecb5b493eed575f42c46
X-Patchwork-Hint: ignore
Message-Id: <20260216201905.DCF4086F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kf5/*: bump to v5.116
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31d58806d8113eba4f0cecb5b493eed575f42c46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is the last (known) release of KDE Frameworks 5, read the announcement
https://kde.org/announcements/frameworks/5/5.116.0/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash | 2 +-
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash                 | 2 +-
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash         | 2 +-
 package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash     | 2 +-
 package/kf5/kf5.mk                                               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
index 70b776b5d7..bf87bc63b6 100644
--- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9717885e30aadf184fa71511930409cabbf08eb6627ea8b051de8804fbcec54c  extra-cmake-modules-5.91.0.tar.xz
+sha256  e8f6d11a6ef478171f845d376523ad5c56e8f7fd4bae8791942cecba0b23cd08  extra-cmake-modules-5.116.0.tar.xz
 sha256  46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b  COPYING-CMAKE-SCRIPTS
diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
index e4ebf2bb39..f9b631827f 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  kcoreaddons-5.91.0.tar.xz
+sha256  defbb4c068fcfccf7a08298ee6f7b88f9c2d3f34e4ae22b8f8e2df47dfb73174  kcoreaddons-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
index 4b6c03a3bb..db1c37960a 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  modemmanager-qt-5.91.0.tar.xz
+sha256  06055351f3a6f8755df60f48b3fdaabb4a406939b9c777f474e8a22bdd116f80  modemmanager-qt-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
index de4504064f..9bf7ee4ad1 100644
--- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2e20ffd995ce64a90b1133b594bab2b2292be54e538f62633e78e8296cc44738  networkmanager-qt-5.91.0.tar.xz
+sha256  0b4e80a4e110776b2f7bcbd4f6371ccbd8d9ed58f01c8a3738ce9c8ef1601b69  networkmanager-qt-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5.mk b/package/kf5/kf5.mk
index 64b08bae4f..9341ea89fb 100644
--- a/package/kf5/kf5.mk
+++ b/package/kf5/kf5.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KF5_VERSION_MAJOR = 5.91
+KF5_VERSION_MAJOR = 5.116
 KF5_VERSION = $(KF5_VERSION_MAJOR).0
 KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
