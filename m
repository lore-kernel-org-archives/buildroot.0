Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29670610CE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29670610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC84B60D4F;
	Wed, 13 Oct 2021 18:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wF5vYa1vVHoX; Wed, 13 Oct 2021 18:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4270E60C2F;
	Wed, 13 Oct 2021 18:12:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 155EA1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1076F4021F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNg02_VKXSXV for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:12:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1465C40155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7776C95608; Wed, 13 Oct 2021 18:09:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 19:59:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b00b9c865d21627a3059cdb95f977558d86ba22f
X-Git-Newrev: c6aac6ebdbbd3873110a9e19de1957e49cb9344e
X-Patchwork-Hint: ignore
Message-Id: <20211013180930.7776C95608@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi: new package
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6328673584744491716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6328673584744491716==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c6aac6ebdbbd3873110a9e19de1957e49cb9344e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdbi implements a database-independent abstraction layer in C,
similar to the DBI/DBD layer in Perl.

http://libdbi.sourceforge.net/

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                 |  2 ++
 package/Config.in          |  1 +
 package/libdbi/Config.in   |  7 +++++++
 package/libdbi/libdbi.hash |  3 +++
 package/libdbi/libdbi.mk   | 16 ++++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 643b5f1060..edf15041d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1151,6 +1151,7 @@ F:	package/json-glib/
 
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/dtbocfg/
+F:	package/libdbi/
 F:	package/lua-augeas/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
@@ -1988,6 +1989,7 @@ F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
+F:	package/libdbi/
 F:	package/lua-augeas/
 F:	package/php-xdebug/
 F:	package/python-augeas/
diff --git a/package/Config.in b/package/Config.in
index 8bfceeb820..51a837cdf6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1415,6 +1415,7 @@ menu "Database"
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libdbi/Config.in"
 	source "package/libgit2/Config.in"
 	source "package/libmdbx/Config.in"
 	source "package/libodb/Config.in"
diff --git a/package/libdbi/Config.in b/package/libdbi/Config.in
new file mode 100644
index 0000000000..ded2bc6e53
--- /dev/null
+++ b/package/libdbi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDBI
+	bool "lidbi"
+	help
+	  libdbi implements a database-independent abstraction layer
+	  in C, similar to the DBI/DBD layer in Perl.
+
+	  http://libdbi.sourceforge.net
diff --git a/package/libdbi/libdbi.hash b/package/libdbi/libdbi.hash
new file mode 100644
index 0000000000..6dd2d3658a
--- /dev/null
+++ b/package/libdbi/libdbi.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  958475e0010a3d8e43ce9ecd6a64d25eacca6ada46c39bc69f949dd70f92ab7a  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-br1.tar.gz
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi/libdbi.mk b/package/libdbi/libdbi.mk
new file mode 100644
index 0000000000..e48fffafce
--- /dev/null
+++ b/package/libdbi/libdbi.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libdbi
+#
+################################################################################
+
+LIBDBI_VERSION = 88b8477d57153b9f736dd19d432d3b7ab1c49073
+LIBDBI_SITE = https://git.code.sf.net/p/libdbi/libdbi
+LIBDBI_SITE_METHOD = git
+LIBDBI_LICENSE = LGPL-2.1+
+LIBDBI_LICENSE_FILES = COPYING
+LIBDBI_INSTALL_STAGING = YES
+# Fetched from git, with no configure script
+LIBDBI_AUTORECONF = YES
+
+$(eval $(autotools-package))

--===============6328673584744491716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6328673584744491716==--
