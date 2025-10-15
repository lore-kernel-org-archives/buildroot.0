Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF4FCCD195
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238278407F;
	Wed, 15 Oct 2025 07:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O2Hm7129UdU; Wed, 15 Oct 2025 07:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8DA840DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8DA840DF;
	Wed, 15 Oct 2025 07:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4CB71C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C8741441
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxlTlWRXA7WX for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DB2C41461
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DB2C41461
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BCBE8710B; Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 09:10:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d756322bbcb9a448913af03af5b0a2a3884fd9a2
X-Git-Newrev: d16c812b7e0d9e18ee5ac9211482ac719fd4f77e
X-Patchwork-Hint: ignore
Message-Id: <20251015071700.4BCBE8710B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.13.8
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
Content-Type: multipart/mixed; boundary="===============2324035272166249275=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2324035272166249275==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d16c812b7e0d9e18ee5ac9211482ac719fd4f77e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.python.org/downloads/release/python-3138/

Fixes the following security issues:

gh-139400: xml.parsers.expat: Make sure that parent Expat parsers are only
garbage-collected once they are no longer referenced by subparsers created
by ExternalEntityParserCreate().  Patch by Sebastian Pipping.

gh-139283: sqlite3: correctly handle maximum number of rows to fetch in
Cursor.fetchmany and reject negative values for Cursor.arraysize.  Patch by
Bénédikt Tran.

gh-135661: Fix CDATA section parsing in html.parser.HTMLParser according to
the HTML5 standard

https://docs.python.org/release/3.13.8/whatsnew/changelog.html#security

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: Mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 8d9e67685f..a7ab3856cd 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3137/
-md5  256cdb3bbf45cdce7499e52ba6c36ea3  Python-3.13.7.tar.xz
+# From https://www.python.org/downloads/release/python-3138/
+md5  ba3da8187b03db6f42052f8707c22564  Python-3.13.8.tar.xz
 # Locally computed
-sha256  5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50f14d4802cdaaa79a  Python-3.13.7.tar.xz
+sha256  b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252  Python-3.13.8.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1546915f08..b501aa7859 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============2324035272166249275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2324035272166249275==--
