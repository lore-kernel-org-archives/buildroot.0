Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F6BC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 07:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 460B740AA9;
	Fri, 12 Aug 2022 07:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 460B740AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N85iNpr0elKE; Fri, 12 Aug 2022 07:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6391540643;
	Fri, 12 Aug 2022 07:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6391540643
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1CB51BF215
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FE3418AF
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 07:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FE3418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_eXB1oVgt4q for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 07:59:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13BBF418A8
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13BBF418A8
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 07:59:20 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 22ACD5C3EB8;
 Fri, 12 Aug 2022 09:59:18 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 09:59:16 +0200
Message-Id: <af963085e90cd21bd5433aaba69fc0cc8646844f.1660291140.git.stefan@agner.ch>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1660291158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=QO+QD0URkjp6ii2OTgsrfs8Zi18aJLicYainEMKIyWY=;
 b=loC+an5d+gIb2x8jfkmc5bpB5hafedH690mUOMTvJZGEHS07Lbz5w1wWQzR8keXN3tYkSt
 FwySgI+mR+qKTu76OU5N3aUGXmPIMpgbBdVoXXT3v4Oek8PI4iB7CrOZEOrIzCQNVTX0/N
 lnab+Twm8rgi6O/WBwa0WLCM0rQbnfg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=loC+an5d
Subject: [Buildroot] [PATCH v2] package/dbus-broker: bump to release 32
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
Cc: nolange79@gmail.com, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new releases mostly contain bug fixes. The build system has been
prepared to use AppArmor library, but since actual support is still
missing it is not worth yet to enable build infrastructure in
Buildroot.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/dbus-broker/dbus-broker.hash |  2 +-
 package/dbus-broker/dbus-broker.mk   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 26ebab7ac1..a2c45c078e 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
+sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 22c5e8d8b7..9b8bf361b5 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 29
+DBUS_BROKER_VERSION = 32
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
@@ -15,13 +15,13 @@ DBUS_BROKER_LICENSE = \
 # the AUTHORS and README, so keep both
 DBUS_BROKER_LICENSE_FILES = \
 	LICENSE \
-	subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
-	subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
-	subprojects/c-list/AUTHORS subprojects/c-list/README.md \
-	subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
-	subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
-	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
-	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
+	subprojects/libcdvar-1/AUTHORS subprojects/libcdvar-1/README.md \
+	subprojects/libcini-1/AUTHORS subprojects/libcini-1/README.md \
+	subprojects/libclist-3/AUTHORS subprojects/libclist-3/README.md \
+	subprojects/libcrbtree-3/AUTHORS subprojects/libcrbtree-3/README.md \
+	subprojects/libcshquote-1/AUTHORS subprojects/libcshquote-1/README.md \
+	subprojects/libcstdaux-1/AUTHORS subprojects/libcstdaux-1/README.md \
+	subprojects/libcutf8-1/AUTHORS subprojects/libcutf8-1/README.md
 
 DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
