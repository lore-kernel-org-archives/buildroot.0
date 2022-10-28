Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF99ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B2B81766;
	Fri, 28 Oct 2022 06:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B2B81766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JxgVBbsnd3IG; Fri, 28 Oct 2022 06:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 588FF8174C;
	Fri, 28 Oct 2022 06:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 588FF8174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8FC51BF286
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B269E40133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B269E40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wu40hMczt6F8 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:59:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBB5F400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBB5F400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB62E873F9; Fri, 28 Oct 2022 06:59:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:58:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5faa07794965a53c8122d252dd41ad4b6903eea
X-Git-Newrev: 014ec19dfe9361ea2b7bc557b73f18719d76dc17
X-Patchwork-Hint: ignore
Message-Id: <20221028065946.BB62E873F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiojobs: bump to version
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=014ec19dfe9361ea2b7bc557b73f18719d76dc17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-async-timeout runtime dependency.

License hash changed due to removal of full license text:
https://github.com/aio-libs/aiojobs/commit/db3e047550d9fb102742d02f8b7bba63ee3ca040

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiojobs/Config.in           | 1 +
 package/python-aiojobs/python-aiojobs.hash | 6 +++---
 package/python-aiojobs/python-aiojobs.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
index 0cdd1c106f..2dc4f3f955 100644
--- a/package/python-aiojobs/Config.in
+++ b/package/python-aiojobs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AIOJOBS
 	bool "python-aiojobs"
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  Jobs scheduler for managing background task (asyncio).
 
diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 44bf20c428..511953713b 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  d537fefca047067255758d7cb9e39db8  aiojobs-0.3.0.tar.gz
-sha256  f6631d42dc4308f7d883abbd70d4e976f3fcc35a3ba1e8eae5d4af4940a1e0c3  aiojobs-0.3.0.tar.gz
+md5  18a5b38cc13b2d59a91fdfec64588b4c  aiojobs-1.1.0.tar.gz
+sha256  f0c43dfc4de359052a67df309b593732c32028deef1bb787c7a363da29accde3  aiojobs-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 5d9a19eb8c..075d807d8b 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 0.3.0
+PYTHON_AIOJOBS_VERSION = 1.1.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/da/09/76d9c0d66d2fd1333835f110cd85f7456de7cf3f60425e3b283fba562731
-PYTHON_AIOJOBS_SETUP_TYPE = distutils
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/99/75/b6d3678d804fffda81ebbac6214c35a4417d5ddbd70ffe7958ad951e64d2
+PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
