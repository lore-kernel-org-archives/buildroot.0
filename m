Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D21C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5761C61199;
	Tue, 25 Jul 2023 20:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5761C61199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Mw2JmWSRuW4; Tue, 25 Jul 2023 20:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B3E61192;
	Tue, 25 Jul 2023 20:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B3E61192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED7711BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABC0782119
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC0782119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1pYCuI-51e2 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B7808211E
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7808211E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57A5882BB4; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:57:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d241394bce0a7d4f25c02ae501fa374e2ccb202
X-Git-Newrev: 074bc42971181ee71d8ff5bd57641b7b7eb7580f
X-Patchwork-Hint: ignore
Message-Id: <20230725200233.57A5882BB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: bump to version
 2.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=074bc42971181ee71d8ff5bd57641b7b7eb7580f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatchling pep517 build backend.

License hash changed due contributors change:
https://github.com/urllib3/urllib3/commit/8e94754f85c59d826ac0604d0dd2a0b41874bb36

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 963967332e..2da7abdf29 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  38f7d1589aa9720101316d07fcbd05c8  urllib3-1.26.13.tar.gz
-sha256  c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8  urllib3-1.26.13.tar.gz
+md5  5d541b944febe50221e24c31cd6e887d  urllib3-2.0.4.tar.gz
+sha256  8d22f86aae8ef5e410d4f539fde9ce6b2113a001bb4d189e0aed70642d602b11  urllib3-2.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
+sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 5868927440..7ff58d9a4a 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.13
+PYTHON_URLLIB3_VERSION = 2.0.4
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c2/51/32da03cf19d17d46cce5c731967bf58de9bd71db3a379932f53b094deda4
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/31/ab/46bec149bbd71a4467a3063ac22f4486ecd2ceb70ae8c70d5d8e4c2a7946
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
-PYTHON_URLLIB3_SETUP_TYPE = setuptools
+PYTHON_URLLIB3_SETUP_TYPE = pep517
+PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling
+HOST_PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
