Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59216D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D54B40BF5;
	Wed,  7 Jan 2026 17:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a15yY3gOi-2J; Wed,  7 Jan 2026 17:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318BD40BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808104;
	bh=r3dQeE1B3R/0srMgkpGrD524KnQ3Tv2UJXqTYY5mvQo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ffOiiZEFf1kMayZIKiM4ltR+QkwqR9gycSccQpgqV4UNyuPA73wijAQu6ytp5MKQ/
	 mPa6K5rnfsFzyaLg0uTtvyCTp0eis2gsxNSAuR/5QnnxcDgZqB8e2yigQL6QSXIPDw
	 95OxgKUO1CgznTE2t3beyjbV8Ze/ICvJUwSNm4qPtWfwimA48VagM2iBiONwHucF0X
	 jcc7JYo5DvOdI+8OaWHK6TltHBxCotHBSxjjU1U5MKFDeC55lPeEiseI6oPfTg+JRt
	 vgPjS+150o5mecSuSMDqKIHdLfPDrzOb8/1TpNqbetzsTE+iW87PPfDCL2A8cB3faT
	 L3S5MnTk5IJcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318BD40BF3;
	Wed,  7 Jan 2026 17:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D35BA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF2D80CA0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klmUzq2pCm2k for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8FB580C9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8FB580C9F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7DDF8225F; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:04 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 39745e60cd359750f038d9dc19058ba9d2a130a3
X-Git-Newrev: 3ddcae0dbf6e513a9904213400f896024a866ced
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.E7DDF8225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-pysendfile: update tarball URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ddcae0dbf6e513a9904213400f896024a866ced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2952d38125d2f8f0229d7daa450f7d961d3417e1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pysendfile/python-pysendfile.hash | 6 ++++--
 package/python-pysendfile/python-pysendfile.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-pysendfile/python-pysendfile.hash b/package/python-pysendfile/python-pysendfile.hash
index d1aff6aed2..2b5b8a9714 100644
--- a/package/python-pysendfile/python-pysendfile.hash
+++ b/package/python-pysendfile/python-pysendfile.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256  f4ca8a7f0be67e3d710c0633dd9aadab6881203c31cb9eb9be4f10361ad3f937  python-pysendfile-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pysendfile/json
+md5  e7b301eddd703ab74a48c59a8fda1f97  pysendfile-2.0.1.tar.gz
+sha256  510a414b270986fba3c79cb76d90a4c910c701bfb43ff983a5d4e92846050e17  pysendfile-2.0.1.tar.gz
+# Locally computed sha256 checksums
 sha256  259f433563cfe0296c84c00381c600e82e0ab1b617ce20fe6e7f555a2b95af26  LICENSE
diff --git a/package/python-pysendfile/python-pysendfile.mk b/package/python-pysendfile/python-pysendfile.mk
index bb8f057d3d..6c2d06e367 100644
--- a/package/python-pysendfile/python-pysendfile.mk
+++ b/package/python-pysendfile/python-pysendfile.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYSENDFILE_VERSION = 2.0.1
-PYTHON_PYSENDFILE_SITE = $(call github,giampaolo,pysendfile,release-$(PYTHON_PYSENDFILE_VERSION))
+PYTHON_PYSENDFILE_SOURCE = pysendfile-$(PYTHON_PYSENDFILE_VERSION).tar.gz
+PYTHON_PYSENDFILE_SITE = https://files.pythonhosted.org/packages/cd/3f/4aa268afd0252f06b3b487c296a066a01ddd4222a46b7a3748599c8fc8c3
 PYTHON_PYSENDFILE_SETUP_TYPE = setuptools
 PYTHON_PYSENDFILE_LICENSE = MIT
 PYTHON_PYSENDFILE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
