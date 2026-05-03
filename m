Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1223FCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D8B6615DF;
	Sun,  3 May 2026 14:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyJJWv6QxT57; Sun,  3 May 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49E8D615BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819902;
	bh=yvmkAm47j/08t9UpOBY3r7SP1vNtpmQbpgr/enuWnw0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P9I0aAhFPAbl0kQPFwnXltPlKXedYuUSa+e3GPvxievGmA/TrHAhSWzeFEdoLU9cw
	 HlMs/AZkQMDrBo7LvXlQy7qoEGj0WmjTuYnh2J5ESgRTyi6lfW0g6rqZy8tuOnlaWN
	 6eLSLACwgp164Ym6PfZT5vmmnJVQRh/gKbe6HqAjJouC9aIcl7z5EnBdpFdnHKpB0X
	 I2p7KpnW5/u+ICzLnI7bD64En5qtob9J/etJTBoSDqZjysi+ZMAij1HmM1jyRWzh+w
	 Uf+iGnJ/kXnlSAopk7mu0jMh4NHIVcxwZMHk1mWjRScNRyLN3clE8OqJo0fhIm+0GG
	 09VA/iNOTNX1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49E8D615BF;
	Sun,  3 May 2026 14:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF83190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38D846131D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRO0iKrXG0cR for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7127612F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7127612F5
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93F6083FC1; Sun,  3 May 2026 14:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9212b466bc633222354630efa8f2b8ecdfed479b
X-Git-Newrev: 3330201b41a87ec7deaffbe0809707419d70241c
X-Patchwork-Hint: ignore
Message-Id: <20260503145050.93F6083FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trove-classifiers: bump
 version to 2026.4.28.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3330201b41a87ec7deaffbe0809707419d70241c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pypa/trove-classifiers/releases/tag/2026.4.28.13

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-trove-classifiers/python-trove-classifiers.hash | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 871f8675fe..c29f05b40d 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  ded610aa62cf3dc78360e96802ca72e8  trove_classifiers-2026.1.14.14.tar.gz
-sha256  00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3  trove_classifiers-2026.1.14.14.tar.gz
+md5  693310e0edde305e2086b7b4cff5fedc  trove_classifiers-2026.4.28.13.tar.gz
+sha256  c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676  trove_classifiers-2026.4.28.13.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 5c5ebb5950..645f57af33 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.1.14.14
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.4.28.13
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/d8/43/7935f8ea93fcb6680bc10a6fdbf534075c198eeead59150dd5ed68449642
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/04/af/88fdebf242bc7bc4957c96c5358a2b2b0f07e5001401906783a521ea9f54
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
