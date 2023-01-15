Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C1C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F4F408F1;
	Sun, 15 Jan 2023 11:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56F4F408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdeAcGB7ORaO; Sun, 15 Jan 2023 11:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79DE7408F8;
	Sun, 15 Jan 2023 11:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DE7408F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF4111BF86C
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 771C641477
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771C641477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxiEVccVZYxL for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5623341296
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5623341296
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4458F870BF; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 203cf2d8b7e9668ba51dc8a72636896e656e7e1b
X-Git-Newrev: 9b88d0f7b9775db73da55504f3968bc0ff25687a
X-Patchwork-Hint: ignore
Message-Id: <20230115110628.4458F870BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 3.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b88d0f7b9775db73da55504f3968bc0ff25687a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index f9e6bc03e8..4ef7afed00 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  d66099b8823ebbdd980cde0dae8f7341  filelock-3.8.2.tar.gz
-sha256  7565f628ea56bfcd8e54e42bdc55da899c85c1abfe1b5bcfd147e9188cebb3b2  filelock-3.8.2.tar.gz
+md5  40eeb4a2963e1b07b8eab12b5db08418  filelock-3.9.0.tar.gz
+sha256  7b319f24340b51f55a2bf7a12ac0755a9b03e718311dac567a0f4f7fabd2f5de  filelock-3.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 86f1220b54..02759935ad 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.8.2
+PYTHON_FILELOCK_VERSION = 3.9.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/73/292d9ea2370840a163e6dd2d2816a571244e9335e2f6ad957bf0527c492f
-PYTHON_FILELOCK_SETUP_TYPE = setuptools
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/0b/dc/eac02350f06c6ed78a655ceb04047df01b02c6b7ea3fc02d4df24ca87d24
+PYTHON_FILELOCK_SETUP_TYPE = pep517
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
+PYTHON_FILELOCK_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
