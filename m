Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72558F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4730960884;
	Mon, 23 Mar 2026 19:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AX-RDvJze7Ii; Mon, 23 Mar 2026 19:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F6860861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295254;
	bh=XGTNxSfL07ls2T3n24pYVcnCqt9DdhWEVheQPn/Jv1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WNDg+0UvJ7eVVH3bjOkzVgq70Y+P184wj0qS4T7eN23WrDMOcXpjzgkXZ25CQ9Zyy
	 L/1ilwOf6RSd+ZNR2cUAweeLyXREqDDxQVnlzpjk2z5FhMbTr6WtOlXiBVexZXzKVA
	 IYCXLFSBRsubGyHYBdowdVoaeGFIPKDNxeLmlvSVAeM5ksrC3JFcW3CHX4gxlk/Tsi
	 Kpm6wltHgjC7cMwyc7CGmNOMyIe/DqBxUViadQmQCiZBkCRFNctYCBlZ3yePHY+F2c
	 LgThKiio72XlsB+oYSerSwbuLe9YV0jy/jSOCmVwdAYWhTYZVAgRbmKEqhxue5OjCt
	 m5T+DOIoxaDGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F6860861;
	Mon, 23 Mar 2026 19:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF50353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31A37405FA
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2VLVm1stfoa for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C5B406B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75C5B406B3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4B1B84C70; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6a18f50e52f30b4029addf7e50a92d72ef2d9d9b
X-Git-Newrev: 928c7fde8bec295612b6569703bf3db2ee19338f
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.B4B1B84C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyjwt:
 security bump version to 2.12.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/928c7fde8bec295612b6569703bf3db2ee19338f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/jpadilla/pyjwt/blob/2.12.1/CHANGELOG.rst

Fixes CVE-2026-32597:
https://github.com/jpadilla/pyjwt/security/advisories/GHSA-752w-5fwx-jx9f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7c5d57fe820b2a1f74ce2e0153c2aaff9b24ca2f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyjwt/python-pyjwt.hash | 6 +++---
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 8eaf7ece50..92de436de8 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  f3273aaf736c24795e78ac48adbab111  pyjwt-2.10.1.tar.gz
-sha256  3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953  pyjwt-2.10.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyjwt/json
+md5  12623a5898f60c4c86ad4ad8d92da216  pyjwt-2.12.1.tar.gz
+sha256  c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b  pyjwt-2.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 18e84b7838..268d83a487 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.10.1
+PYTHON_PYJWT_VERSION = 2.12.1
 PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/e7/46/bd74733ff231675599650d3e47f361794b22ef3e3770998dda30d3b63726
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/c2/27/a3b6e5bf6ff856d2509292e95c8f57f0df7017cf5394921fc4e4ef40308a
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
