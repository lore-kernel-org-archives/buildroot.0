Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E49CCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D950A40C98;
	Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2P5YJ2_qdBm; Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB82E40C9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB82E40C9A;
	Thu, 30 Oct 2025 08:22:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CECED707
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5267613A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzhT8aMSTGlp for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF48A60DD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF48A60DD8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB9B487A0D; Thu, 30 Oct 2025 08:22:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:39 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c352644855242b50c569415f18c1255bd5873af1
X-Git-Newrev: cf4a9f884b30925c2cf9ed184f7c02016876b891
X-Patchwork-Hint: ignore
Message-Id: <20251030082227.EB9B487A0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/python3: security
 bump version to 3.13.8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1064395399859577579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1064395399859577579==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cf4a9f884b30925c2cf9ed184f7c02016876b891
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
(cherry picked from commit d16c812b7e0d9e18ee5ac9211482ac719fd4f77e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============1064395399859577579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1064395399859577579==--
