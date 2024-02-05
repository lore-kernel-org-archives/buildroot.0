Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309DAC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4DF60F2F;
	Mon,  5 Feb 2024 13:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4DF60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtNQcOS9Qq_I; Mon,  5 Feb 2024 13:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14BCA60FAB;
	Mon,  5 Feb 2024 13:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14BCA60FAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C799D1BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A086F60FAC
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A086F60FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vP8XCkKvadAk for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B54B960F2B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54B960F2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A37FF86C90; Mon,  5 Feb 2024 13:34:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:33:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5351578b9698021704df06e840047b0b0c7b372b
X-Git-Newrev: f62d1ad32a2d1903840be8416b7d5b5f419fa86e
X-Patchwork-Hint: ignore
Message-Id: <20240205133402.A37FF86C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytablewriter: bump to
 version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f62d1ad32a2d1903840be8416b7d5b5f419fa86e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-msgfy runtime dependency.

Drop no longer required python-six runtime dependency.

Add new python-tcolorpy runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytablewriter/Config.in                 | 11 ++++++-----
 package/python-pytablewriter/python-pytablewriter.hash |  4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   |  4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 041c30eb6c..e0252625cd 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -2,14 +2,15 @@ config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	bool "python-pytablewriter"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_MSGFY # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
+	select BR2_PACKAGE_PYTHON_TCOLORPY # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
-	  pytablewriter is a python library to write a table in various
-	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
-	  Python, reStructuredText.
+	  pytablewriter is a Python library to write a table in
+	  various formats: AsciiDoc / CSV / Elasticsearch / HTML /
+	  JavaScript / JSON / LaTeX / LDJSON / LTSV / Markdown /
+	  MediaWiki / NumPy / Excel / Pandas / Python /
+	  reStructuredText / SQLite / TOML / TSV / YAML.
 
 	  https://github.com/thombashi/pytablewriter
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index f082542dfb..d4432ee121 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5  0eaa4a2429d22389b5e4b8c5f5135bbb  pytablewriter-0.64.2.tar.gz
-sha256  99409d401d6ef5f06d1bc40f265a8e3053afe4cbfbaf709f71124076afb40dbb  pytablewriter-0.64.2.tar.gz
+md5  4e3d421d026f30fadec4ac1670e524ee  pytablewriter-1.2.0.tar.gz
+sha256  0204a4bb684a22140d640f2599f09e137bcdc18b3dd49426f4a555016e246b46  pytablewriter-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index d865a89330..d8bc3615dd 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.64.2
+PYTHON_PYTABLEWRITER_VERSION = 1.2.0
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/a6/e1/50c1cd9734a9edc1386913b178f9e4757c1bc37665c1855a6596c25957d6
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/cc/a9/76aa4430d32ae10b23e4347006dc4c67a3e2a00621e4bb38a60c1a77f15e
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
