Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B203C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ACDB849B9;
	Sun, 15 Sep 2024 21:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GETI9rN_1X-1; Sun, 15 Sep 2024 21:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FC784967
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00FC784967;
	Sun, 15 Sep 2024 21:42:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60CFA1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E30E608A1
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJqqzZvIj8CT for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA5F60A5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FA5F60A5B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BAE28155E; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:59:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8d0f6940f9607f01a0b45c5fedfcca598dcd6a9
X-Git-Newrev: a68b855e7ae7a492d2fcfa9f7624f5d70c122e6b
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.5BAE28155E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-text: bump to
 version 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a68b855e7ae7a492d2fcfa9f7624f5d70c122e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-inflect runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-text/Config.in               | 1 -
 package/python-jaraco-text/python-jaraco-text.hash | 4 ++--
 package/python-jaraco-text/python-jaraco-text.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
index 9ce179b056..44000ccb18 100644
--- a/package/python-jaraco-text/Config.in
+++ b/package/python-jaraco-text/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_JARACO_TEXT
 	bool "python-jaraco-text"
 	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
-	select BR2_PACKAGE_PYTHON_INFLECT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
index 704e75d6be..1e79bf746a 100644
--- a/package/python-jaraco-text/python-jaraco-text.hash
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.text/json
-md5  9f63a5cdd56061ebd84d8175d1df3b70  jaraco.text-3.12.0.tar.gz
-sha256  389e25c8d4b32e9715bf530596fab0f5cd3aa47296e43969392e18a541af592c  jaraco.text-3.12.0.tar.gz
+md5  3c519c7a49d6448e6dc2073d466afd39  jaraco_text-4.0.0.tar.gz
+sha256  5b71fecea69ab6f939d4c906c04fee1eda76500d1641117df6ec45b865f10db0  jaraco_text-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 06b028d65f..2d612196a6 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_TEXT_VERSION = 3.12.0
-PYTHON_JARACO_TEXT_SOURCE = jaraco.text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
-PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/53/30/52edc6c9997d48b0d9fbedb6a29edab2b397968f637b76aae299a9128c34
+PYTHON_JARACO_TEXT_VERSION = 4.0.0
+PYTHON_JARACO_TEXT_SOURCE = jaraco_text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
+PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/4f/00/1b4dbbc5c6dcb87a4278cc229b2b560484bf231bba7922686c5139e5f934
 PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
