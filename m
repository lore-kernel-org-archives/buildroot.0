Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD68C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A76285038;
	Fri, 26 Jan 2024 08:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A76285038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNK2cspGbiq7; Fri, 26 Jan 2024 08:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA5628502E;
	Fri, 26 Jan 2024 08:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA5628502E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 216A51BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47A3145B4F
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47A3145B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylqxz3JLeA_6 for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B99845BBB
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B99845BBB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE5786530; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:47:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be94e1ab54d11e4d3a387a4937ee65fa4d99b3f6
X-Git-Newrev: be267a227a9138f48b1ef93c68b93adae1870ff8
X-Patchwork-Hint: ignore
Message-Id: <20240126084846.5AE5786530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiojobs: bump to version
 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=be267a227a9138f48b1ef93c68b93adae1870ff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-async-timeout runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiojobs/Config.in           | 1 -
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
index 2dc4f3f955..0cdd1c106f 100644
--- a/package/python-aiojobs/Config.in
+++ b/package/python-aiojobs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_AIOJOBS
 	bool "python-aiojobs"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  Jobs scheduler for managing background task (asyncio).
 
diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 8920e3aecd..baaa61b331 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  529a4367f9bc63a482a2962ba54bfd51  aiojobs-1.2.0.tar.gz
-sha256  a4bcfb6a2d21ad08dea904e9f73040b37657d0c33cc8d77e683e47de5fcf0b12  aiojobs-1.2.0.tar.gz
+md5  d4742018c2188147f1efa41645b5758b  aiojobs-1.2.1.tar.gz
+sha256  59d6e7ad7829e9d0f73bfceeae28153b541be6b0959a08cc5ceb222717c888ff  aiojobs-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index be0acd3fbc..9e4a55e13c 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.2.0
+PYTHON_AIOJOBS_VERSION = 1.2.1
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/e0/4685393810a267c09edef41ddafd0dd28108d95e1b91019b1843fc6e5b83
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/07/ad/e4240f9225022798e0e651ced8f6dc022e88eae4f2df6e1482a8f3c0d54d
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
