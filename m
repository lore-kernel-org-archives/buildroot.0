Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2856C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C1560F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79C1560F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F214403A7;
	Sun, 26 Sep 2021 21:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crbjjnvA2dTr; Sun, 26 Sep 2021 21:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B10403AE;
	Sun, 26 Sep 2021 21:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDE9F1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C6B3402F2
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HhD_tWv7ZW5z for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE5440332
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 053A48D2AD; Sun, 26 Sep 2021 20:57:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:17:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f403309ed8ff1db2c91e304c59cb3b10ac16cc45
X-Git-Newrev: 8dae40a87b13f12c23b4e3b788b3b1d5af1796da
X-Patchwork-Hint: ignore
Message-Id: <20210926205757.053A48D2AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{3}-pycryptodomex: bump to
 version 3.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dae40a87b13f12c23b4e3b788b3b1d5af1796da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to test vector license being moved:
https://github.com/Legrandin/pycryptodome/commit/eda4f65718f9f9cfa3868f17675679ac583fa5bb

This doesn't affect us since we don't build the test vectors.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pycryptodomex/Config.in                 | 2 +-
 package/python-pycryptodomex/python-pycryptodomex.hash | 6 +++---
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-pycryptodomex/Config.in b/package/python-pycryptodomex/Config.in
index c7127fee59..a6d42f383d 100644
--- a/package/python-pycryptodomex/Config.in
+++ b/package/python-pycryptodomex/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
 	help
 	  Cryptographic library for Python.
 
-	  http://www.pycryptodome.org
+	  https://www.pycryptodome.org
diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 1016672af8..0dd2a7c08d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  08bc8fbbcd6060c06f1f10e2dc18b834  pycryptodomex-3.9.9.tar.gz
-sha256  7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51  pycryptodomex-3.9.9.tar.gz
+md5  91b86ca7fa80d41179d7735067c7347a  pycryptodomex-3.10.1.tar.gz
+sha256  541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62  pycryptodomex-3.10.1.tar.gz
 # Locally computed sha256 checksums
-sha256  d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
+sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 341d1fa0f5..fc2dca4da9 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.9.9
+PYTHON_PYCRYPTODOMEX_VERSION = 3.10.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index bd7602c9d4..76ad74b43f 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.9
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.10.1
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
