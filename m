Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6DBC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77584417E3;
	Mon,  5 Feb 2024 10:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77584417E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tQLdwcGeUmL; Mon,  5 Feb 2024 10:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B30417DE;
	Mon,  5 Feb 2024 10:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94B30417DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 051791BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFC8F82690
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC8F82690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRZUVqQwsd0S for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F219D8268F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F219D8268F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6B386A88; Mon,  5 Feb 2024 10:31:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:31:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a7afebe03803484261a82b5ca3fa59813e9b324
X-Git-Newrev: 0149b50166e11d90c90f603dc488c2b964c019a6
X-Patchwork-Hint: ignore
Message-Id: <20240205103117.DF6B386A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to version
 7.4.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0149b50166e11d90c90f603dc488c2b964c019a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-py runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pytest/Config.in          | 1 -
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index c8f9a6eb5b..b42457e67d 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
-	select BR2_PACKAGE_PYTHON_PY # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 7f79b94d8d..e710003535 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  8620558e8971b11207b2d6b083906cf9  pytest-7.4.2.tar.gz
-sha256  a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069  pytest-7.4.2.tar.gz
+md5  e2ac4c70861f26d735b64e5687bb218e  pytest-7.4.4.tar.gz
+sha256  2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280  pytest-7.4.4.tar.gz
 # Locally computer sha256
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 326d951a32..3170a1a9db 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 7.4.2
+PYTHON_PYTEST_VERSION = 7.4.4
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e5/d0/18209bb95db8ee693a9a04fe056ab0663c6d6b1baf67dd50819dd9cd4bd7
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/80/1f/9d8e98e4133ffb16c90f3b405c43e38d3abb715bb5d7a63a5a684f7e46a3
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
