Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6430CC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B1881882;
	Fri, 23 Aug 2024 17:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJiOpIpttPVY; Fri, 23 Aug 2024 17:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A07F81EEC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A07F81EEC;
	Fri, 23 Aug 2024 17:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E51F1BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E18BF840E3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5IbU_ooBjYk for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F080C81882
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F080C81882
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:34:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF1686489; Fri, 23 Aug 2024 17:34:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:33:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebef582bd28fa183818ab973b58e167c75548a07
X-Git-Newrev: 65247fcc6a12eb2443ae9861e7cd36b3881a466e
X-Patchwork-Hint: ignore
Message-Id: <20240823173401.DDF1686489@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlparse: security bump to
 version 0.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=65247fcc6a12eb2443ae9861e7cd36b3881a466e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
* https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-1-jul-15-2024
* https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-0-apr-13-2024

Version 0.5.0 fixes the following security issue [1]:
Parsing heavily nested list leads to Denial of Service

Build backend switched from flit to hatchling in [2].

[1] https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-2m57-hf25-phgg
[2] https://github.com/andialbrecht/sqlparse/commit/326a316446c3e091a93950251e3e376ebf0d4127

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 0b7c14d9ae..1fe8429724 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  67798c7a0dae90f263d20e9ecf62c8cd  sqlparse-0.4.4.tar.gz
-sha256  d446183e84b8349fa3061f0fe7f06ca94ba65b426946ffebe6e3e8295332420c  sqlparse-0.4.4.tar.gz
+md5  969a64f03d7da1144fc74aad390f9db4  sqlparse-0.5.1.tar.gz
+sha256  bb6b4df465655ef332548e24f08e205afc81b9ab86cb1c45657a7ff173a3a00e  sqlparse-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 3f99eb6476..57cef1d672 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.4.4
+PYTHON_SQLPARSE_VERSION = 0.5.1
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/65/16/10f170ec641ed852611b6c9441b23d10b5702ab5288371feab3d36de2574
-PYTHON_SQLPARSE_SETUP_TYPE = flit
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/73/82/dfa23ec2cbed08a801deab02fe7c904bfb00765256b155941d789a338c68
+PYTHON_SQLPARSE_SETUP_TYPE = pep517
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
+PYTHON_SQLPARSE_DEPENDENCIES = host-python-hatchling
 PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
 PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
