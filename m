Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF0EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 18:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B7396116B;
	Mon, 19 Jun 2023 18:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B7396116B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfYsK3EB3gzk; Mon, 19 Jun 2023 18:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0583061274;
	Mon, 19 Jun 2023 18:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0583061274
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF851BF344
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 18:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 059C840490
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 18:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 059C840490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABigF-q1q7Jc for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 18:15:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0105A4031C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0105A4031C
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 18:15:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 081A0A4C0947;
 Mon, 19 Jun 2023 20:14:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57524)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qBJP0-0007V8-1V;
 Mon, 19 Jun 2023 20:14:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 20:14:58 +0200
Message-Id: <20230619181458.1596060-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619181458.1596060-1-bernd@kuhls.net>
References: <20230619181458.1596060-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687198499;
 bh=u8NHcYa6o8dXfLMVex27I07ylt4P+5XVl5E/mSHOKiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CgMtex1LnjQNTEAzyhYi3BXvwI/X0rRP6KKnxUi20Gug9W5Qdn7yJ80VrP5/xJFSL
 uXodEtQZnoFbpy9ZPgejiCc/ASnbF00MjEHZDhNPbMdWxEWzburfpqSj2G7GE76ADc
 XeeqneRtaMBGusR3BDc/y6cs7V+iWamXbxPIayV7//18S3B5SE5T91+geZ70jCMSSD
 9uf1nqbdblhHo7E4kND0ALNrulOSF6QswoheP0+c5wKuZKLecTHHALuaplmolQ08Jb
 ZtHs48JpwqJwn5RWUIEUxIJAHgJrOhZ5ETyEWjHIRKDURQ8PfmwHst34TW4vW/GRCZ
 D8crsIEKt9ngg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=CgMtex1L
Subject: [Buildroot] [PATCH 2/2] package/syslog-ng: bump version to 4.2.0
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated upstream URL of patch file.

Release notes:
https://axoflow.com/axosyslog-release-4-2/
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                              | 1 -
 package/syslog-ng/0001-fix-build-on-uclibc.patch | 3 ++-
 package/syslog-ng/syslog-ng.conf                 | 2 +-
 package/syslog-ng/syslog-ng.hash                 | 2 +-
 package/syslog-ng/syslog-ng.mk                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c78168e5ea..36ab2845d7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1483,7 +1483,6 @@ package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
-package/syslog-ng/0001-fix-build-on-uclibc.patch Upstream
 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch Upstream
 package/sysrepo/S51sysrepo-plugind Indent Shellcheck
 package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch Upstream
diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch b/package/syslog-ng/0001-fix-build-on-uclibc.patch
index dbb9b66b5c..07c3f0721c 100644
--- a/package/syslog-ng/0001-fix-build-on-uclibc.patch
+++ b/package/syslog-ng/0001-fix-build-on-uclibc.patch
@@ -9,8 +9,9 @@ pthread_spin_trylock so check for this function before using it
 Fixes:
  - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b
 
+Upstream: https://github.com/buytenh/ivykis/pull/22
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/buytenh/ivykis/pull/17]
 ---
  configure.ac   | 3 +++
  src/spinlock.h | 4 ++++
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index f4b74dc8c1..a3cfa8dacf 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.1
+@version: 4.2
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 8ab4d5ac3b..a917331580 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f20e  syslog-ng-4.1.1.tar.gz
+sha256  092bd17fd47002c988aebdf81d0ed3f3cfd0e82b388d2453bcaa5e67934f4dda  syslog-ng-4.2.0.tar.gz
 sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index ecc8eeddce..39433185b4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.1.1
+SYSLOG_NG_VERSION = 4.2.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
