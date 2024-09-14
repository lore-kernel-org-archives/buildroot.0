Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FB3C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58089814B6;
	Sun, 15 Sep 2024 21:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9TvoubpxZOd; Sun, 15 Sep 2024 21:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12369817AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12369817AE;
	Sun, 15 Sep 2024 21:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7D41BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D44405A4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYpcdLtnnglc for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF07405AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EF07405AD
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B4E983685; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:51:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a842aec7bc5c9bf6dcda7a540cdcfcc16ada2a
X-Git-Newrev: 56282c3b12b2dc8057ee5cde390b5b53ae59b56e
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.4B4E983685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=56282c3b12b2dc8057ee5cde390b5b53ae59b56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/sqlalchemy/alembic/commit/8829bd64a70708ef9144604ea0f0a5179d07ccbe

Pass --skip-dependency-check build option due to python-alembic
unnecessarily restricting the maximum setuptools version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 1f752ebc7e..6cfd327f6e 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  29579d34ea694627280b52a3d3116664  alembic-1.13.1.tar.gz
-sha256  4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595  alembic-1.13.1.tar.gz
+md5  0118e72e5ffaf9752d995fa7d6c2a565  alembic-1.13.2.tar.gz
+sha256  1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef  alembic-1.13.2.tar.gz
 # Locally computed sha256 checksums
-sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
+sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 52e30e39ba..79ec56ab65 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.13.1
+PYTHON_ALEMBIC_VERSION = 1.13.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/7b/24/ddce068e2ac9b5581bd58602edb2a1be1b0752e1ff2963c696ecdbe0470d
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/66/e2/efa88e86029cada2da5941ec664d50d9a3b2a91f5066405c6f90e5016c16
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
+PYTHON_ALEMBIC_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
