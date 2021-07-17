Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA940C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B391A60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B391A60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF1A60724;
	Tue,  3 Aug 2021 23:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VolrSyurJf4K; Tue,  3 Aug 2021 23:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921C160644;
	Tue,  3 Aug 2021 23:35:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD801BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B749406BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qg4180ZpX5w9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77F594063B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCA0C83FEF; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:09:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f11128b779a7e285665902d09977f268b1bbee77
X-Git-Newrev: c64abc69349e28707a8861f0719edf65e7a91462
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.BCA0C83FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python{3}-cryptography: bump to version 3.3.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c64abc69349e28707a8861f0719edf65e7a91462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is the last version to support python2.

License hash change due to removal of OpenSSL locking reference:
https://github.com/pyca/cryptography/commit/49109ce1a6e870cb6cc87f05d9ae7c03d70a684b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.hash | 6 +++---
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 package/python3-cryptography/python3-cryptography.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index c6768ff21a..7cb38c8d3d 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5  163608a7cb838c6b39360e1e64377d54  cryptography-3.0.tar.gz
-sha256  8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053  cryptography-3.0.tar.gz
+md5  e2ce2ec8a63965fad351f36ed70fde4b  cryptography-3.3.2.tar.gz
+sha256  5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed  cryptography-3.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256  35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
+sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index eff0fa14a5..98c65e1528 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cryptography/python3-cryptography.mk
-PYTHON_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON_CRYPTOGRAPHY_VERSION = 3.3.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
index 03112e41d4..516864f315 100644
--- a/package/python3-cryptography/python3-cryptography.mk
+++ b/package/python3-cryptography/python3-cryptography.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cryptography/python-cryptography.mk
-PYTHON3_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON3_CRYPTOGRAPHY_VERSION = 3.3.2
 PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
 PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
