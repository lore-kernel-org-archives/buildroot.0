Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DB6E95A86
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F2A60B15;
	Tue, 30 Dec 2025 13:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhrsk47_ACjD; Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B8F60B55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099628;
	bh=rtB5mO2xcdi1Uo7PHlmmeuKYBCDONOA6WRHUA7WccdY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LYtmsEbl9sjcTjVxanmP0W+Qk9gDYs4HEPoG2OEzYJTfh6srxkEB9zK6Z7JmCYGv3
	 8nlwPnuOMhaavE5g5Xzybq0jGM/eIbi45JYySPSPxgK7C2uwmeBnfpNfLktPr1fQEy
	 s5MkdG7HQXnXepRYS6L3gUIjmy58AwZqJZQdqPZ4NobeooDjS5o9rMH8fYYdbiJXx7
	 p4UHhFC9bo8W7WMDkbLESAsSv83Y+w5WuSHt4BrI1tFMLZe29tJoF/btUDkkOzEBhl
	 tr2vR6I5PSX4ENXCAVPOOJLjWcypPSuR+0Rk6ZlDvKyPDbKZjePu2oMuYbGLPKKXHV
	 WLOiep/foQe3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B8F60B55;
	Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE766177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0C8D40611
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovApt0hdAayj for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C83C4013F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C83C4013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CA6F87A70; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 13:44:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 063e25de6f418cee8082c5398e546b4842ee435c
X-Git-Newrev: c68927229646820dbd0d2a5653811662623a5ae1
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.2CA6F87A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: bump to
 version 0.25.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c68927229646820dbd0d2a5653811662623a5ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from poetry to pdm pep517 build backend.

Add new python-anyio runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tortoise-orm/Config.in                | 1 +
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
index 62b1a5a86e..57cebc6489 100644
--- a/package/python-tortoise-orm/Config.in
+++ b/package/python-tortoise-orm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TORTOISE_ORM
 	bool "python-tortoise-orm"
 	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 8e99e815df..6e1f46dd6f 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  ef8df163a207f40230c618efa18ca32b  tortoise_orm-0.25.1.tar.gz
-sha256  4d5bfd13d5750935ffe636a6b25597c5c8f51c47e5b72d7509d712eda1a239fe  tortoise_orm-0.25.1.tar.gz
+md5  b3dab10562c6574232334e954666f3eb  tortoise_orm-0.25.3.tar.gz
+sha256  b6dedd388393624628ec46228c93df361533ceb3925986fa2d1d22debc838a7d  tortoise_orm-0.25.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 32327bae38..3a380710a0 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.25.1
+PYTHON_TORTOISE_ORM_VERSION = 0.25.3
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d7/9b/de966810021fa773fead258efd8deea2bb73bb12479e27f288bd8ceb8763
-PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/dd/be/0fdfcd8295f4f02a280f33bdda99c3edba450f9a212149232f2fbb6afa96
+PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
+PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
