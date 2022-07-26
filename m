Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A09C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57EF0400E4;
	Tue, 26 Jul 2022 19:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57EF0400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVPFL8q1xZEz; Tue, 26 Jul 2022 19:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA9E400C1;
	Tue, 26 Jul 2022 19:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA9E400C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6341BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 762E0600B9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 762E0600B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYmSJtJUw2Np for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D28C6001B
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D28C6001B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:38:34 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc15b.ng.seznam.cz (email-smtpc15b.ng.seznam.cz [10.23.14.195])
 id 4970703aff50cf614977ce4d; Tue, 26 Jul 2022 21:38:32 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay8.ng.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Tue, 26 Jul 2022 21:38:29 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:38:10 +0200
Message-Id: <20220726193810.43817-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-szn-frgn: <ac563087-9774-44f2-9670-d48f4aeedcfb>
X-szn-frgc: <0>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1658864312; bh=SiQIwbQZdZISMyYA5laQcPP9vLkB4IhuSS1g/GnCAKo=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
 b=DpWFmBXvVuK/01NltoURImr8qho7rrYkyWNVGx9f+u+aKl1VoTwOLRdWuDukNFcx2
 75yVaIBVTHz5YxJ7NqbTn3Q4/o+iy2XbD8rNFgfuHBnaOazgsp/5qgXoY8RZbqte8q
 buXll0i3Kja1mAC8IWaTfjxLtmTu3mr6JSU4zhh8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=DpWFmBXv
Subject: [Buildroot] [PATCH 1/1] package/debianutils: bump version to 5.7-0.2
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

From: Petr Vorel <petr.vorel@gmail.com>

debian/copyright has been moved to a different tarball
(debianutils_5.7-0.2.debian.tar.xz) which does not contain the source
code, thus build from salsa git instead of tarball from
https://snapshot.debian.org/.

Add patch to disable po4a (unnecessary dependency just to get
translations).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/debianutils/0001-Disable-po4a.patch | 25 +++++++++++++++++++++
 package/debianutils/debianutils.hash        |  6 ++---
 package/debianutils/debianutils.mk          |  7 +++---
 3 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 package/debianutils/0001-Disable-po4a.patch

diff --git a/package/debianutils/0001-Disable-po4a.patch b/package/debianutils/0001-Disable-po4a.patch
new file mode 100644
index 0000000000..2af9a93279
--- /dev/null
+++ b/package/debianutils/0001-Disable-po4a.patch
@@ -0,0 +1,25 @@
+From 7134952f97ad5afb208e270571afbfe12670cc14 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Mon, 25 Jul 2022 12:59:45 +0200
+Subject: [PATCH] Disable po4a
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 86ac499..7c61896 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = po4a
++# SUBDIRS = po4a
+ 
+ EXTRA_DIST = CHANGELOG CONTRIBUTING .gitlab-ci.yml
+ 
+-- 
+2.37.1
+
diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 16a45d4ea1..cd77b54ad1 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
-sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
 # Locally calculated
-sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
+sha256  76ba936451d9ea23a397d60d93ffc1a39544534f17a1f5b816cdaf4bb7a57486  debianutils-debian-5.7-0.2.tar.bz2
+# Locally calculated from https://snapshot.debian.org/archive/debian/20220501T215056Z/pool/main/d/debianutils/debianutils_5.7-0.2.debian.tar.xz
+sha256  3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567  debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index d2c41130fb..05ef43135d 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.11
-DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
+DEBIANUTILS_VERSION = 5.7-0.2
+DEBIANUTILS_SOURCE = debianutils-debian-$(DEBIANUTILS_VERSION).tar.bz2
+DEBIANUTILS_SITE = https://salsa.debian.org/debian/debianutils/-/archive/debian/$(DEBIANUTILS_VERSION)
+DEBIANUTILS_AUTORECONF = YES
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
