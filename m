Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F5EE8FDB8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81CD860A6B;
	Fri, 26 Dec 2025 20:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6S45bT0MsljL; Fri, 26 Dec 2025 20:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 126BB60A85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766782072;
	bh=qGSm+xWchRid2IT1DzzXkR8Bewu/AjwqPLe7KwLooGw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r6LMN7Ec6HnKJVgYjiLKw7LO3kujZ4ktxWm4GEgyLt4Nak/YHtlrd8MF+L6hwfacy
	 XnoTDAgwO9ogA4j6rf5OhPgj88wiVn8kufxHZ1sYCfij9iEDwgrcgrcXNlx2wsVSqz
	 Yl2Zes3vNaAwPDt9y6244cjpLIpr4E4irni6sD5fU61S00GvG8FQUH52x8WIDQIAOb
	 i3qBCd20Bo4jTKciA4dK/NezPbk0aCpPBzsCl6RZzJGKROeuO4DFuRi2sivA4xEhiz
	 8mnlHzr8IJe1JklxVvqS2xFQK3vGkTpvlxPwGv8ROe227RsFDEs6zo3VtnrjXrHfA6
	 BGQXpWi16/EqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 126BB60A85;
	Fri, 26 Dec 2025 20:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1447B255
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11607812C7
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIIJvcsu5LsV for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93F1812C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93F1812C3
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B31F187717; Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 21:31:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b7f9adda2562e4dde73402f6691d39c76b4e284
X-Git-Newrev: db6f933571be09b0da3c73e01231d114a4e78a9f
X-Patchwork-Hint: ignore
Message-Id: <20251226204748.B31F187717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlparse: bump to 0.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=db6f933571be09b0da3c73e01231d114a4e78a9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-5-dec-19-2025

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 8d9c27afb7..b541aec42f 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  b5bf6082e38fb99bf8217f429b73346a  sqlparse-0.5.4.tar.gz
-sha256  4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e  sqlparse-0.5.4.tar.gz
+md5  2023800dc264c2fedab3250a8eb43995  sqlparse-0.5.5.tar.gz
+sha256  e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e  sqlparse-0.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 6d952b215a..af1af475d8 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.4
+PYTHON_SQLPARSE_VERSION = 0.5.5
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/18/67/701f86b28d63b2086de47c942eccf8ca2208b3be69715a1119a4e384415a
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/90/76/437d71068094df0726366574cf3432a4ed754217b436eb7429415cf2d480
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
