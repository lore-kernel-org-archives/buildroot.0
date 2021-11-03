Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB44DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0046112E
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E0046112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D5060AED;
	Wed,  3 Nov 2021 21:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlhMh-kce2V7; Wed,  3 Nov 2021 21:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51E360B01;
	Wed,  3 Nov 2021 21:50:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 120E01BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F4768175F
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9Id8MYzEFOW for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:50:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 346358175B
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:50:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 804568A4D5; Wed,  3 Nov 2021 21:47:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:50:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0da70ac4b01ec8d97e24496493086e24c601f0e
X-Git-Newrev: 9e9b3f53a38c34e3295eb9dc0054093d571dab55
X-Patchwork-Hint: ignore
Message-Id: <20211103214712.804568A4D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: bump to version 3.18.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e9b3f53a38c34e3295eb9dc0054093d571dab55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop Suppression file for musl libc patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...8663-Patch-Suppression-file-for-musl-libc.patch | 69 ----------------------
 package/valgrind/valgrind.hash                     |  4 +-
 package/valgrind/valgrind.mk                       |  2 +-
 3 files changed, 3 insertions(+), 72 deletions(-)

diff --git a/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch b/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
deleted file mode 100644
index b7e075e9fd..0000000000
--- a/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From c5a5190ec7936e53bcd2082fb0151bc48a804b8b Mon Sep 17 00:00:00 2001
-From: Paul Floyd <pjfloyd@wanadoo.fr>
-Date: Tue, 8 Dec 2020 15:07:29 +0100
-Subject: [PATCH] Bug 408663 - Patch: Suppression file for musl libc
-
-[Upstream https://sourceware.org/git/?p=valgrind.git;a=patch;h=f4d98ff79d5a79102b777ea7e23002d9f7326489
- reduced to the missing musl.supp file download source file
- Reported https://bugs.kde.org/show_bug.cgi?id=435438]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- musl.supp | 46 ++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 46 insertions(+)
- create mode 100644 musl.supp
-
-diff --git a/musl.supp b/musl.supp
-new file mode 100644
-index 0000000..864172a
---- /dev/null
-+++ b/musl.supp
-@@ -0,0 +1,46 @@
-+# Suppressions for musl libc
-+# See: https://www.openwall.com/lists/musl/2017/06/15/4
-+
-+{
-+   musl-dynlink-false-positive1
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_direct_deps
-+   fun:load_deps
-+   fun:load_deps
-+   fun:__dls3
-+   fun:__dls2b
-+   fun:__dls2
-+}
-+
-+{
-+   musl-dynlink-false-positive2
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_direct_deps
-+   fun:load_deps
-+   fun:load_deps
-+   fun:__dls3
-+   fun:__dls2
-+}
-+
-+{
-+   musl-dynlink-false-positive3
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_library
-+   fun:load_preload
-+   fun:__dls3
-+   fun:__dls2b
-+   fun:__dls2
-+}
-+
-+{
-+   musl-dynlink-false-positive4
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_library
-+   fun:load_preload
-+   fun:__dls3
-+   fun:__dls2
-+}
--- 
-2.30.2
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 648a590ca3..748fc3eb82 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  afe11b5572c3121a781433b7c0ab741b  valgrind-3.17.0.tar.bz2
+md5  de56a5532b0c81781db677ca712c585a  valgrind-3.18.1.tar.bz2
 # locally computed
-sha256  ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2  valgrind-3.17.0.tar.bz2
+sha256  00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5  valgrind-3.18.1.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b87e1e518f..52f2a04ffa 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.17.0
+VALGRIND_VERSION = 3.18.1
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
