Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081CFFC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F35381E9C;
	Sat,  7 Mar 2026 10:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkgdliECFONj; Sat,  7 Mar 2026 10:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427E7818E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878056;
	bh=rQGlBam+oFPtWKyTL5A7qHufKkYuZpKCLvk1i+rvGEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WFMhmDUUMkJ+aIT8LugTSqM8vXT65BtL/P7gryOR/BeqAEntVIuENVi5QiGBj1Mty
	 tJZ1IpyHTvUbLOuClVNSZgSDtoBR9yl+mDMVkXYEyg9W6g7RJAyJe+ZQ46U7Xpr6o2
	 zF2OYgZMdkirXf+J8aJrElCL2E7bFuSqlQJpX5Ivg0puU6P7ETJPGRMmf02splu/jc
	 fvIXEFiMmo7vWim02IZdTB4O3LA3IG1lZ1c+ClsGLWNrZ/p7ykMRdHh0FIX2xgBs/x
	 LQ4xvkH8HNsnOeGKaYafDaf7UdOhN0TKSLus0r2Qenb25H6V/XE+gD95lVwcxIDUA1
	 EjDH4NbLti73A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 427E7818E8;
	Sat,  7 Mar 2026 10:07:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5742223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB994817A9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3skhCRxuxlVv for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7718187F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF7718187F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12CE786213; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:00:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7b8c9e2778dc08a45942af9aaf7312ec3d78ff8
X-Git-Newrev: 9faac374c740e2dc1df32b47303a2e05ea7f5592
X-Patchwork-Hint: ignore
Message-Id: <20260307100730.12CE786213@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: security bump
 to version 46.0.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9faac374c740e2dc1df32b47303a2e05ea7f5592
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since version 46.0.3, see:
https://cryptography.io/en/46.0.5/changelog/

Fixes:
https://www.cve.org/CVERecord?id=CVE-2026-26007

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien:
 - mark commit as a security bump
 - add link to changelog and cve
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 1ca864d995..25d987a321 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  983924b55a7bf04cca9e329ca46310602a42c0bbd0b9e77795f85c1b50691f97  python-cryptography-46.0.3-cargo4.tar.gz
+sha256  18ecafb2c1f2de6d02d1b848f0f80736f0f93e8708afaf3df3064e8722077291  python-cryptography-46.0.5-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index f2da36b08a..0747394fc6 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 46.0.3
+PYTHON_CRYPTOGRAPHY_VERSION = 46.0.5
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/33/c00162f49c0e2fe8064a62cb92b93e50c74a72bc370ab92f86112b33ff62
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
