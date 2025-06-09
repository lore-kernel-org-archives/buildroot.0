Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BFDC67861
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 11:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4564415B5;
	Mon,  9 Jun 2025 11:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnRS3BVC6xQv; Mon,  9 Jun 2025 11:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA52B4158B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA52B4158B;
	Mon,  9 Jun 2025 11:04:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A57871A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 980668130B
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JZBOttkiI-M for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 11:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B06BD812FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06BD812FB
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B06BD812FB
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:04:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (3)
Received: from zm.int.grinn-global.com (pub-196.163.106.212.multiplay.pl
 [212.106.163.196])
 by server220076.nazwa.pl (Postfix) with ESMTP id 193141BC1DE;
 Mon, 09 Jun 2025 12:56:48 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jun 2025 12:56:41 +0200
Message-ID: <20250609105643.1298292-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 1/2] package/python-pytest: bump to 8.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See [1] for changelog.

[1] https://github.com/pytest-dev/pytest/blob/main/doc/en/changelog.rst#pytest-840-2025-06-02

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-pytest/Config.in          | 1 +
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index 912dc4949b..681133d5e0 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index c59666a854..4edff526b5 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  f22d0f0e12aee3b97225a89504d657cb  pytest-8.3.5.tar.gz
-sha256  f4efe70cc14e511565ac476b57c279e12a855b11f48f212af1080ef2263d3845  pytest-8.3.5.tar.gz
+md5  13da9ffcb0c631f9f2f6ac36bdab3176  pytest-8.4.0.tar.gz
+sha256  14d920b48472ea0dbf68e45b96cd1ffda4705f33307dcc86c676c1b5104838a6  pytest-8.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index fcb064b35d..2ed143accc 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 8.3.5
+PYTHON_PYTEST_VERSION = 8.4.0
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/ae/3c/c9d525a414d506893f0cd8a8d0de7706446213181570cdbd766691164e40
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/fb/aa/405082ce2749be5398045152251ac69c0f3578c7077efc53431303af97ce
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
