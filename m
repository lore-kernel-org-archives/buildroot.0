Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AABE67481
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525A54050A;
	Sat, 20 Dec 2025 19:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHGP-YxrMF9s; Sat, 20 Dec 2025 19:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A663240450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766258462;
	bh=b7vTsuHwi4UhfWKvC/PJvbi0HKKfq/jeztzqSwqAkqE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZeSUuw8bcoznWnnvJ3t8BKqucNxBnd1BYXUEI5FKNbJLPTwKGBH2hgTAu7BZqw7pB
	 LBaOlCv4lPoKc/eLHedTASsXpDaDdJrpwpdd18Q2fyWmTJU3UK4qsPDlbJoBE/rhJc
	 ojmQh2sN4gg3zgwMIvI3VLCp9ro5JHh7DQC9N//Biq1pkHuIzN9yEBdAlLI1YxLfVq
	 XGrrCdj10hqqjQdtq6Gnw7RORFn1dN+KpfIZY+BaaLhw84mDWUgPltKLGDaEVHL50C
	 Z94rkpECLFU144lp4FDD4Mep7nIZ86IcW1T82QCfK/bSqxkc52/XCeHyA6epJpyXU1
	 AjjszbPTHV6MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A663240450;
	Sat, 20 Dec 2025 19:21:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 226CD1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08F0B60618
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jr11tjfXcqHC for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46983605F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46983605F4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:20:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3551C817E5; Sat, 20 Dec 2025 19:20:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 20:11:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 828d2288cd4b69cd23ad3c7e1699edbd51b1dce1
X-Git-Newrev: 9218276c548e790e92c6ce6519ba1b319dec525f
X-Patchwork-Hint: ignore
Message-Id: <20251220192058.3551C817E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlparse: bump to 0.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=9218276c548e790e92c6ce6519ba1b319dec525f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-4-nov-28-2025

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 3e54d227f4..8d9c27afb7 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  9764a42264c9a3102526c87260e73d11  sqlparse-0.5.3.tar.gz
-sha256  09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272  sqlparse-0.5.3.tar.gz
+md5  b5bf6082e38fb99bf8217f429b73346a  sqlparse-0.5.4.tar.gz
+sha256  4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e  sqlparse-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 0140961393..6d952b215a 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.3
+PYTHON_SQLPARSE_VERSION = 0.5.4
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/e5/40/edede8dd6977b0d3da179a342c198ed100dd2aba4be081861ee5911e4da4
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/18/67/701f86b28d63b2086de47c942eccf8ca2208b3be69715a1119a4e384415a
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
