Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364FCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B36A61536;
	Sun,  3 May 2026 14:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_GBLHcoWzjR; Sun,  3 May 2026 14:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E3B6150F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819877;
	bh=TqhJ1DfKLxNUM40ro2A8Z0mouhY3WWMLauLzjBi/LI8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cuITArRbfSNpw/008zhuGsrl8ZuzAb9AX572cSQlQYZG6aCX8ruhG84PXzrSv7RT7
	 6YiNJCMy3+vMBVMbg/KKBvVK+nSNZTu/mKlmuPVSUzsHt2TXqhJuoWv8Q5sJK74IoO
	 UulnyO/3iG6ODBUqMwIfvPuXoJ8s6lhgN5SAFhvDzpR9n4sygK8mlIu/siKnCPDpQC
	 fXU4lhS/w/egDFXLm/fZBq9Uoel8YmFCa0UH9IXVSz8wHVx0wxY4ZW47fWuM7xy4Ih
	 5RxEJvog3s3okxrxVHG2oqujLdBQpPJrPhXTld84ZDMHM3G9/Ax3VRab7HpTk2oriR
	 u7CimwNOS1nCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E3B6150F;
	Sun,  3 May 2026 14:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB02A190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEDBC84266
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJD-yOSfxrCO for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93838409F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E93838409F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6BEB83FC0; Sun,  3 May 2026 14:50:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a789f4bdb8517e86d45881d7c0d196e0311d4bc7
X-Git-Newrev: 6566823d4d7f8836cf03506c865684a96d0283aa
X-Patchwork-Hint: ignore
Message-Id: <20260503145043.A6BEB83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: security bump
 version to 9.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6566823d4d7f8836cf03506c865684a96d0283aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pytest-dev/pytest/blob/9.0.3/doc/en/changelog.rst

Fixes CVE-2025-71176.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 09644dbdba..cdfab80acc 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  ce26088b3b97ab8fed58c8883de23241  pytest-9.0.2.tar.gz
-sha256  75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11  pytest-9.0.2.tar.gz
+md5  0cd1c357553d2e3eb850d71843b375d1  pytest-9.0.3.tar.gz
+sha256  b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c  pytest-9.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 427936c69e..e949eff8a4 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 9.0.2
+PYTHON_PYTEST_VERSION = 9.0.3
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/d1/db/7ef3487e0fb0049ddb5ce41d3a49c235bf9ad299b6a25d5780a89f19230f
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/7d/0d/549bd94f1a0a402dc8cf64563a117c0f3765662e2e668477624baeec44d5
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
