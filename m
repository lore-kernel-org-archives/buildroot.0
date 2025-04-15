Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28D4C369BD
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB56610EC;
	Tue, 15 Apr 2025 17:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4173FFdwjz8p; Tue, 15 Apr 2025 17:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B3460605
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B3460605;
	Tue, 15 Apr 2025 17:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9731B109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8820860BB9
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWHq0RngFJ4G for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C350D6062B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C350D6062B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAAEC8484A; Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 19:16:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cebfadde9ba7b26eaea51448cb425f878eb31885
X-Git-Newrev: 1ae65b1fb5fd0d6f54dcda8d432828c44c14366f
X-Patchwork-Hint: ignore
Message-Id: <20250415172201.BAAEC8484A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tzlocal: bump to 5.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ae65b1fb5fd0d6f54dcda8d432828c44c14366f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch the test assert to use 'Europe/Berlin' instead of
'posix/Europe/Berlin'. The tz-name is an internal implementation detail
anyway and the lookup changed to prefer the stated name in /etc/timezone
again, if it matches the configured timezone via /usr/share/zoneinfo.

Ref: https://github.com/regebro/tzlocal/commit/4ffac9232bc854a0fa25df9f275a4267fb232850

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tzlocal/python-tzlocal.hash             | 4 ++--
 package/python-tzlocal/python-tzlocal.mk               | 4 ++--
 support/testing/tests/package/sample_python_tzlocal.py | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tzlocal/python-tzlocal.hash b/package/python-tzlocal/python-tzlocal.hash
index dce19103a5..838e6ded21 100644
--- a/package/python-tzlocal/python-tzlocal.hash
+++ b/package/python-tzlocal/python-tzlocal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tzlocal/json
-md5  9d8d4c12b047d5d45e6eb72bb95fd90e  tzlocal-5.3.tar.gz
-sha256  2fafbfc07e9d8b49ade18f898d6bcd37ae88ce3ad6486842a2e4f03af68323d2  tzlocal-5.3.tar.gz
+md5  f8eb4bf0eb262ba422741d032d6cfedf  tzlocal-5.3.1.tar.gz
+sha256  cceffc7edecefea1f595541dbd6e990cb1ea3d19bf01b2809f362a03dd7921fd  tzlocal-5.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d99ab209aeb16aad2c25c90ffd83c1a981e290ffff76a420a2ab03e03f041b8c  LICENSE.txt
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
index c616974f64..2c1e5ff87a 100644
--- a/package/python-tzlocal/python-tzlocal.mk
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TZLOCAL_VERSION = 5.3
+PYTHON_TZLOCAL_VERSION = 5.3.1
 PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
-PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/33/cc/11360404b20a6340b9b4ed39a3338c4af47bc63f87f6cea94dbcbde07029
+PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/8b/2e/c14812d3d4d9cd1773c6be938f89e5735a1f11a9f184ac3639b93cef35d5
 PYTHON_TZLOCAL_SETUP_TYPE = setuptools
 PYTHON_TZLOCAL_LICENSE = MIT
 PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
diff --git a/support/testing/tests/package/sample_python_tzlocal.py b/support/testing/tests/package/sample_python_tzlocal.py
index 9aeb431c64..a02818bf9e 100644
--- a/support/testing/tests/package/sample_python_tzlocal.py
+++ b/support/testing/tests/package/sample_python_tzlocal.py
@@ -2,4 +2,4 @@ from tzlocal import get_localzone
 from zoneinfo import ZoneInfo
 
 tz = get_localzone()
-assert tz == ZoneInfo(key='posix/Europe/Berlin')
+assert tz == ZoneInfo(key='Europe/Berlin')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
