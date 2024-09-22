Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A7ECF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800E381467;
	Sun, 22 Sep 2024 10:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gz61ugng_gpo; Sun, 22 Sep 2024 10:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D6F5840B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D6F5840B6;
	Sun, 22 Sep 2024 10:37:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 356501BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7E0C40635
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU3JW0UWVC4T for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1B740638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C1B740638
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 681DE811F3; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c4510bf6c540661eefc64c3c5675ea010f0c90b
X-Git-Newrev: 6a2dc345ef584fd209074616dc2981f994427a3c
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.681DE811F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-treq: bump to version 24.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a2dc345ef584fd209074616dc2981f994427a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-treq/Config.in        | 1 +
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 5d76a5cdd6..9b75ff40d6 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents. It provides a simple, higher level
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index aecf71aad8..b44aba35d3 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  43892086d556e7596392134f1e10bdef  treq-22.2.0.tar.gz
-sha256  df757e3f141fc782ede076a604521194ffcb40fa2645cf48e5a37060307f52ec  treq-22.2.0.tar.gz
+md5  a48996ff540651deded304b638ba54ea  treq-24.9.1.tar.gz
+sha256  15da7fc404f3e4ed59d0abe5f8eef4966fabbe618039a2a23bc7c15305cefea8  treq-24.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 57dc50ee74..65179246f5 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 22.2.0
+PYTHON_TREQ_VERSION = 24.9.1
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/08/94/424f3bb11eaf464880d076cca2e9d0ee21a1be805fe9761b87eccba5b3ae
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
