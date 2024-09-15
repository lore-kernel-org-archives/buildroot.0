Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5D1C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1664081461;
	Sun, 15 Sep 2024 21:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZaTjgy8Z8jL; Sun, 15 Sep 2024 21:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E7181EEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E7181EEE;
	Sun, 15 Sep 2024 21:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18B231BF95A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C7F80A50
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EDmgG6iApAQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F5280AE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F5280AE2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E78F83687; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5c887bdb916fe30c2fe48770e476a0963cbc0c9
X-Git-Newrev: 4afa0d048b2d4339d53edbe1bf54a0ec66910a93
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.5E78F83687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-blinker: bump to version
 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4afa0d048b2d4339d53edbe1bf54a0ec66910a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate build backend from setuptools to flit.

The license file got renamed, but the contents did not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-blinker/python-blinker.hash | 6 +++---
 package/python-blinker/python-blinker.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
index e0c1d600eb..d9f1052254 100644
--- a/package/python-blinker/python-blinker.hash
+++ b/package/python-blinker/python-blinker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/blinker/json
-md5  0306b831281e9918ffb0ac6e3e18b47f  blinker-1.7.0.tar.gz
-sha256  e6820ff6fa4e4d1d8e2747c2283749c3f547e4fee112b98555cdcdae32996182  blinker-1.7.0.tar.gz
+md5  ce2f9fb3bc0c0000db11f012f5f5afda  blinker-1.8.2.tar.gz
+sha256  8f77b09d3bf7c795e969e9486f39c2c5e9c39d4ee07424be2bc594ece9642d83  blinker-1.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.rst
+sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.txt
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index 234126a500..7ce06c2177 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BLINKER_VERSION = 1.7.0
+PYTHON_BLINKER_VERSION = 1.8.2
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/a1/13/6df5fc090ff4e5d246baf1f45fe9e5623aa8565757dfa5bd243f6a545f9e
-PYTHON_BLINKER_SETUP_TYPE = setuptools
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/1e/57/a6a1721eff09598fb01f3c7cda070c1b6a0f12d63c83236edf79a440abcc
+PYTHON_BLINKER_SETUP_TYPE = flit
 PYTHON_BLINKER_LICENSE = MIT
-PYTHON_BLINKER_LICENSE_FILES = LICENSE.rst
+PYTHON_BLINKER_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
