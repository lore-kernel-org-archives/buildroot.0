Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814BFC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 526D381F16;
	Fri, 21 Aug 2026 15:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG0cN41UNmAY; Fri, 21 Aug 2026 15:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325150;
	bh=Q2utRjDbIDogSooAVGdGfkofRkWJZJZ5z6LdlTeiY/8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kf66pVKc7c9ZNjvhjSBwKNDUI2OcvOpQhjbsbol3icQ64ZdFQTBvNd9pkEyo5y4Jk
	 jlKqTo4qOT8qks744iTIp4fg867uxm9vomyL07i0ofsZH4rR7APQo1jJIO3WwtvKUB
	 5gOghZnAAEsHpxggartwmubnn9DDpGlrIR9ucTPDS5CEw+8BujR0kX9iJgSM7qbTH1
	 UeZqZwnmGxgAfmdL8XyMNeZiTVNO78aqWAC0CVvQmGtqLqAYnPf3SXWHAdQzfB4Fd4
	 /BwlLK6/zOjRy1wQr7T9o+LEo9aFr3DcRwj3kGhqVeQJ+mL4nJ41IC4rA4Bk1tdZjA
	 mnVome7Wk3vPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B486081F01;
	Fri, 21 Aug 2026 15:12:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA7241CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B36C8117B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-Av5V9krzJ1 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D761981140
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AC5E8E127; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 11:48:26 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6700a74d5e899f0f6ab88bcc85c4be2a71634092
X-Git-Newrev: 583e189d42ffcb8713734f99991b25bb89d3639a
X-Patchwork-Hint: ignore
Message-Id: <20260821151018.4AC5E8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/apache: use
 "Debian" filesystem layout to fix read-only rootfs
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/583e189d42ffcb8713734f99991b25bb89d3639a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The previous configuration placed both logs and PID file in /var/logs,
which is not writable with a read-only rootfs (e.g. squashfs), as well
as non-standard. Starting HTTPD during boot failed with:

(30)Read-only file system: AH00091: httpd: could not open error log file /var/logs/error_log.
AH00015: Unable to open logs

An additional issue was that the Buildroot-default --prefix=/usr
override meant various Apache-internal directories (e.g. htdocs) were
placed directly in /usr. Note that the upstream default prefix is
/usr/local/apache2, not /usr/local.

Using the "Debian" layout provides a standard-compatible layout with
logs in /var/log/apache2 and PID file in /var/run/apache2 (both in
tmpfs with the default Buildroot fstab). Both directories need to
exist when the server starts, so handle that in the init script.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1006666f67ba2837ba4cf1014186f3b1cc8f3415)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/apache/S50apache      |  2 ++
 package/apache/apache.mk      | 13 ++++++++-----
 package/apache/apache.service |  1 +
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/apache/S50apache b/package/apache/S50apache
index 71e8837bae..fd1c58312f 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -2,6 +2,8 @@
 # shellcheck disable=SC2034 # checkpackage-required variable
 DAEMON="apache"
 
+mkdir -p "/var/log/apache2" "/var/run/apache2"
+
 case "$1" in
 	start|restart|graceful|graceful-stop|stop)
 		apachectl -k "$1"
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 2466bc9461..debc999bcd 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -43,7 +43,9 @@ APACHE_CONF_OPTS = \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
 	--with-mpm=$(APACHE_MPM) \
-	--disable-luajit
+	--disable-luajit \
+	--enable-layout=Debian \
+	--prefix=/
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 APACHE_CONF_OPTS += --enable-brotli
@@ -111,14 +113,15 @@ endif
 
 define APACHE_FIX_STAGING_APACHE_CONFIG
 	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
-	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
-	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
-	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/bin%' $(STAGING_DIR)/usr/build/config_vars.mk
+	$(SED) 's%/usr/share/apache2/build%$(STAGING_DIR)/usr/share/apache2/build%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
+	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/sbin%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
+	$(SED) 's%^includedir = .*%includedir = $(STAGING_DIR)/usr/include/apache2%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
 
 define APACHE_CLEANUP_TARGET
-	$(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build
+	$(RM) -rf $(TARGET_DIR)/usr/share/apache2/default-site/htdocs/manual $(TARGET_DIR)/usr/share/apache2/build
 endef
 APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_CLEANUP_TARGET
 
diff --git a/package/apache/apache.service b/package/apache/apache.service
index b8747e2658..561e4e2851 100644
--- a/package/apache/apache.service
+++ b/package/apache/apache.service
@@ -4,6 +4,7 @@ After=network.target
 
 [Service]
 Type=forking
+ExecStartPre=/bin/mkdir -p /var/log/apache2 /var/run/apache2
 ExecStart=/usr/bin/apachectl start
 ExecReload=/usr/bin/apachectl graceful
 ExecStop=/usr/bin/apachectl stop
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
