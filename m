Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E143C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E362661018;
	Mon,  5 Feb 2024 13:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E362661018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsFdsukXqkqC; Mon,  5 Feb 2024 13:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AEDB6105C;
	Mon,  5 Feb 2024 13:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AEDB6105C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8961BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A8DA60F1A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8DA60F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2Jq0iOjyvs1 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0763360E6B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0763360E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA41A86C7B; Mon,  5 Feb 2024 13:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd3ec6b977a84a324639682f16f82b459382f8e5
X-Git-Newrev: fa51f4ac41327eb8277938f2e8f5c11c59113cb3
X-Patchwork-Hint: ignore
Message-Id: <20240205132914.DA41A86C7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.13.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa51f4ac41327eb8277938f2e8f5c11c59113cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new runtime dependencies:
 - python-sqlalchemy
 - python-mako
 - python-typing-extensions

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-alembic/Config.in           | 3 +++
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/Config.in b/package/python-alembic/Config.in
index a53dde7f7f..33fe3c3682 100644
--- a/package/python-alembic/Config.in
+++ b/package/python-alembic/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PYTHON_ALEMBIC
 	bool "python-alembic"
+	select BR2_PACKAGE_PYTHON_MAKO # runtime
+	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Alembic is a database migrations tool written by the author
 	  of SQLAlchemy.
diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index df1f4fba02..1f752ebc7e 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  642d563af853b317f018026f3edd5dba  alembic-1.12.1.tar.gz
-sha256  bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f  alembic-1.12.1.tar.gz
+md5  29579d34ea694627280b52a3d3116664  alembic-1.13.1.tar.gz
+sha256  4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595  alembic-1.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index fd41e0df66..52e30e39ba 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.12.1
+PYTHON_ALEMBIC_VERSION = 1.13.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/44/b4/253fe31261d9f5d603d89bd9e6fba1625494a6d761d319902dfe4db59016
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/7b/24/ddce068e2ac9b5581bd58602edb2a1be1b0752e1ff2963c696ecdbe0470d
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
