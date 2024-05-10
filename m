Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D1DC25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B89423EE;
	Fri, 10 May 2024 20:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKKuHw6m_hcT; Fri, 10 May 2024 20:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4009423FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4009423FA;
	Fri, 10 May 2024 20:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6D3E1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3371615B8
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17FdwPYVGdqj for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7BF60665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7BF60665
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:07:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B06CF86EC3; Fri, 10 May 2024 20:07:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 21:56:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f80b393d4506783bb2d27d3d97730040857ec4e1
X-Git-Newrev: eb60c4054c25129d78651a66d1e7554aff04767f
X-Patchwork-Hint: ignore
Message-Id: <20240510200701.B06CF86EC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmdb: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb60c4054c25129d78651a66d1e7554aff04767f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lmdb/Config.in | 13 +++++++++++++
 package/lmdb/lmdb.hash |  3 +++
 package/lmdb/lmdb.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 11b413e95a..b282d64508 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1141,6 +1141,7 @@ F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lua-inotify/
+F:	package/lmdb/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
diff --git a/package/Config.in b/package/Config.in
index 2b1e4a86b9..14e016daf3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1597,6 +1597,7 @@ menu "Database"
 	source "package/libodb-mysql/Config.in"
 	source "package/libodb-pgsql/Config.in"
 	source "package/libpqxx/Config.in"
+	source "package/lmdb/Config.in"
 	source "package/mariadb/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/lmdb/Config.in b/package/lmdb/Config.in
new file mode 100644
index 0000000000..f4ae9f3103
--- /dev/null
+++ b/package/lmdb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LMDB
+	bool "lmdb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  OpenLDAP Lightning Memory-Mapped Database
+
+	  LMDB is compact, fast, powerful, and robust and implements
+	  a simplified variant of the BerkeleyDB (BDB) API.
+
+	  https://symas.com/lmdb/
+
+comment "lmdb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
new file mode 100644
index 0000000000..d72c66aace
--- /dev/null
+++ b/package/lmdb/lmdb.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dd70a8c67807b3b8532b3e987b0a4e998962ecc28643e1af5ec77696b081c9b0  lmdb-0.9.31.tar.gz
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
new file mode 100644
index 0000000000..dafe7332cb
--- /dev/null
+++ b/package/lmdb/lmdb.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# lmdb
+#
+################################################################################
+
+LMDB_VERSION = 0.9.31
+LMDB_SITE = $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
+LMDB_LICENSE = OLDAP-2.8
+LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
+LMDB_INSTALL_STAGING = YES
+
+define LMDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
+		XCFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define LMDB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		DESTDIR="$(STAGING_DIR)" \
+		prefix=/usr \
+		install
+endef
+
+define LMDB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		DESTDIR="$(TARGET_DIR)" \
+		prefix=/usr \
+		install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
