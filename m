Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF11C83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 15:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF8C81458;
	Sun, 13 Jul 2025 15:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BScN7faVm5b; Sun, 13 Jul 2025 15:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A397E81465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A397E81465;
	Sun, 13 Jul 2025 15:46:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A32DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AC614015E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSu1387BNiLy for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 15:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BAB4007A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4BAB4007A
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F5086556; Sun, 13 Jul 2025 15:46:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 17:30:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cccf9b9e5a37fc2d4ec72bcabb108bce69d2cda1
X-Git-Newrev: e5baa5ed1309cf852b4d38315e4824a7a7cc6da4
X-Patchwork-Hint: ignore
Message-Id: <20250713154655.C5F5086556@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to 8.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5baa5ed1309cf852b4d38315e4824a7a7cc6da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for changelog.

[1] https://github.com/pytest-dev/pytest/blob/main/doc/en/changelog.rst#pytest-840-2025-06-02

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
