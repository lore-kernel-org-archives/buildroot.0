Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11F3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC06813FD;
	Sun, 11 Dec 2022 09:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC06813FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gu6mqDNitRVz; Sun, 11 Dec 2022 09:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF34813C4;
	Sun, 11 Dec 2022 09:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF34813C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0A871BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4152A40AB9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4152A40AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqX09dHosxVg for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 475E140946
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475E140946
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40B7485FAA; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b67238f53867f40b485b79eddaa7ef6fad9ca4
X-Git-Newrev: 3ef45500e35fac59e403af4709e16e40d2c9bb4a
X-Patchwork-Hint: ignore
Message-Id: <20221211085515.40B7485FAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-falcon: bump to version
 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef45500e35fac59e403af4709e16e40d2c9bb4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Always build cython modules as sdist does not contain prebuilt
cython sources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index d4e99a6998..497b5d2b57 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  0172450908573a4449a5937810d512b9  falcon-3.1.0.tar.gz
-sha256  f2760bd18c16393a6fb5e55f371f67921edb72febe693a82b3c5e82195d087b7  falcon-3.1.0.tar.gz
+md5  383673fc6378428d0db5861a416cad0d  falcon-3.1.1.tar.gz
+sha256  5dd393dbf01cbaf99493893de4832121bd495dc49a46c571915b79c59aad7ef4  falcon-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 01b5eca4a2..b5ebc399dc 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.1.0
+PYTHON_FALCON_VERSION = 3.1.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/36/53/4fd90c6c841bc2e4be29ab92c65e5406df9096c421f138bef9d95d43afc9
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/29/bc/c11c9a14bb5b4d18a024ee51da15b793d1c869d151bb4101e324e0d055a8
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-
-ifeq ($(BR2_PACKAGE_HOST_PYTHON_CYTHON),y)
 PYTHON_FALCON_DEPENDENCIES += host-python-cython
-endif
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
