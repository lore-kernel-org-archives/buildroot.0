Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C3C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC23442543;
	Fri, 10 May 2024 20:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLaTBmclzCI5; Fri, 10 May 2024 20:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5B7842544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5B7842544;
	Fri, 10 May 2024 20:10:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 481B71BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31239846F0
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ve3GoB2IsHID for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636FF846EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 636FF846EE
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:10:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BC377F948; Fri, 10 May 2024 20:10:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e695da731ffe3a8b06526840055cb38c71b47fde
X-Git-Newrev: e4c3de5b58cdcbd81fa1e61eb6a8e8f82e267819
X-Patchwork-Hint: ignore
Message-Id: <20240510201048.5BC377F948@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to 8.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4c3de5b58cdcbd81fa1e61eb6a8e8f82e267819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove no longer used attrs dependency (already since 7.3.0[1]).

Changelog:
https://docs.pytest.org/en/stable/changelog.html#pytest-8-1-1-2024-03-08

[1] https://docs.pytest.org/en/stable/changelog.html#pytest-7-3-0-2023-04-08

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest/Config.in          | 1 -
 package/python-pytest/python-pytest.hash | 6 +++---
 package/python-pytest/python-pytest.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index b42457e67d..912dc4949b 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYTEST
 	bool "python-pytest"
-	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index e710003535..1d5a874238 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  e2ac4c70861f26d735b64e5687bb218e  pytest-7.4.4.tar.gz
-sha256  2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280  pytest-7.4.4.tar.gz
-# Locally computer sha256
+md5  6a85eccffeb0fa15c104f408d82ce7fa  pytest-8.1.1.tar.gz
+sha256  ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044  pytest-8.1.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 3170a1a9db..90dc91b654 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 7.4.4
+PYTHON_PYTEST_VERSION = 8.1.1
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/80/1f/9d8e98e4133ffb16c90f3b405c43e38d3abb715bb5d7a63a5a684f7e46a3
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/30/b7/7d44bbc04c531dcc753056920e0988032e5871ac674b5a84cb979de6e7af
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
