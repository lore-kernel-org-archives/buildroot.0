Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25871F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7CB161374;
	Sun, 15 Mar 2026 22:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BV0bLyBUBJMB; Sun, 15 Mar 2026 22:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9084F61366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613155;
	bh=6VXbdOhqa4380HP5OxagcLd0F2P8Vb8Wjzkbu3w1TbQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7k718lRhj1Mi9fb+vup2vaxmb8C3ScfEY4nhAyxNB6UPy9PRq4y8Sf4GeVVX6NlZ
	 MVfvvAfQwdqjn5wK0ebK9Zckiv2B3iA5qodQMdGsMn5g7eaxYAC4JVJADuF4V3ukvf
	 yf5Q2UJdzjnEi3QpACmrMuP8akeD/8bXfTzEbo/dj0YJFDVhNP3J6z521W7Q8ffrug
	 KGMMw+Hzha3H3xTkVUpTDLWuTFmmDoP2/jhKtKtm92akoMEPQWHbuurWMEDG/hNDkD
	 CQ9LRFxIXzBFBu6AYeecdpAR+NjTZT/pxA5Sn/38MdmsyRWOMiYXCELeromHE/2Q4N
	 OamOFMigXo/2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9084F61366;
	Sun, 15 Mar 2026 22:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B5D357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B39BA40AF5
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOzsEjUkqVJD for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0A140AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA0A140AB9
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17ADD80FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3179517a7edd8af85a5277548b4d543b5975d7d1
X-Git-Newrev: 50007f836aacaac0f3878bf6499bbb8ade7ff4e0
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.17ADD80FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump version to
 2.0.48
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50007f836aacaac0f3878bf6499bbb8ade7ff4e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/sqlalchemy/sqlalchemy/blob/rel_2_0_48/doc/build/changelog/changelog_20.rst

Updated license hash due to copyright year bump:
https://github.com/sqlalchemy/sqlalchemy/commit/9ea4237f2136081ee784d12b53f4c0605a5a15a0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index cfc42fd77d..e94ae9acf2 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  9df94d7a8629cf43d2190d5e511fa47f  sqlalchemy-2.0.45.tar.gz
-sha256  1632a4bda8d2d25703fdad6363058d882541bdaaee0e5e3ddfa0cd3229efce88  sqlalchemy-2.0.45.tar.gz
+md5  6c8b6f2648f192707671d55e96ee5ce9  sqlalchemy-2.0.48.tar.gz
+sha256  5ca74f37f3369b45e1f6b7b06afb182af1fd5dde009e4ffd831830d98cbe5fe7  sqlalchemy-2.0.48.tar.gz
 # Locally computed sha256 checksums
-sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
+sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index cf5440a715..88ef21f7b7 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.45
+PYTHON_SQLALCHEMY_VERSION = 2.0.48
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/be/f9/5e4491e5ccf42f5d9cfc663741d261b3e6e1683ae7812114e7636409fcc6
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/73/b4a9737255583b5fa858e0bb8e116eb94b88c910164ed2ed719147bde3de
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
