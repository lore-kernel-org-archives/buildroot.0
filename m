Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66622F46C59
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E5860AC1;
	Mon,  6 Apr 2026 16:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhrjtL2wmRos; Mon,  6 Apr 2026 16:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FEFE60AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775494085;
	bh=eq7SdbzrFld9a+5ZDCxJKfTqMkNXvZuH3qSdfWX8JTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GbLt4r+yNgNqIB/7DYWPXnRBvnEim5ffrOLJJ7RFTiHpkB6dQhNiiFXfagQlb/Qp4
	 fUp1mx0TD6ZHo+AEmNMx9oeO7/9Ghb50IvTUV1++iJ+Mz52DVLD4HE8+w/2NDINqEk
	 j2AELdGLM6a/f6Db23Pvf2Ow17qhKQc6yk3ZseIZaCjf27tGwuAaZOIe1LJNC3QQWo
	 Q8F4VslsaV8EgBC4Tp7rxQQM+y58m6wwMrUUWxG8M9n77+eK2HgjRINqcVeGwyLN79
	 fTjNrf9J5GiD5Ltsp2oCTikn7gnTqAN+uExRHnF8fKpD8j70HHKyATjn0roxGuxkJV
	 agy0VSfQ6U1Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEFE60AAD;
	Mon,  6 Apr 2026 16:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A022EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57AF440126
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCvxgI0XFPBv for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC0D4009B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AC0D4009B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF6EA80500; Mon,  6 Apr 2026 16:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 18:38:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec621099904b6e8d8d16bac3b9d31954faeb98e4
X-Git-Newrev: c8e9c53d8c477ec44b5d442065c08020e2ca00c3
X-Patchwork-Hint: ignore
Message-Id: <20260406164801.EF6EA80500@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leafnode2: bump version to
 2.0.0.alpha202601
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c8e9c53d8c477ec44b5d442065c08020e2ca00c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/leafnode-2/leafnode-2/-/blob/leafnode-2.0.0.alpha202601/NEWS

Rebased patch 0001.

Upstream switched from pcre to pcre2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/leafnode2/0001-cross_makefile.patch |  7 ++++---
 package/leafnode2/Config.in                 |  2 +-
 package/leafnode2/leafnode2.hash            |  2 +-
 package/leafnode2/leafnode2.mk              | 12 ++++++------
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/leafnode2/0001-cross_makefile.patch b/package/leafnode2/0001-cross_makefile.patch
index 32116446c3..06d5722b05 100644
--- a/package/leafnode2/0001-cross_makefile.patch
+++ b/package/leafnode2/0001-cross_makefile.patch
@@ -7,14 +7,15 @@ Fix cross-compilation issues
    cross-compiling. We're anyway not root, so simply remove the
    chown/chgrp dance.
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 2.0.0.alpha202601]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 Index: b/Makefile.am
 ===================================================================
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -311,7 +311,7 @@
+@@ -324,7 +324,7 @@
  
  configparam_data.c: $(srcdir)/config.table b_sortnl$(EXEEXT) genconfigparam_data.awk
  	rm -f config.table.sorted
@@ -23,7 +24,7 @@ Index: b/Makefile.am
  	$(AWK) -f $(srcdir)/genconfigparam_data.awk <config.table.sorted >$@ \
  	|| { rm -f $@ ; false ; }
  
-@@ -326,13 +326,7 @@
+@@ -339,13 +339,7 @@
  install-data-hook:
  	$(INSTALL) -d -m 02770 $(DESTDIR)$(SPOOLDIR)
  	$(INSTALL) -d -m 02770 $(DESTDIR)$(SPOOLDIR)/leaf.node
diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index df9b246946..dc6977925b 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LEAFNODE2
 	bool "leafnode2"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Leafnode-2 is a store-and-forward NNTP (or Usenet) proxy
 	  server designed for small sites with just a few active
diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index 9c86173ae1..040e0d92a4 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  42f2185f29a74f683a962e9cf6e38bc5f8a342d0dde8b6a03457a165365e3445  leafnode2-9543ffaf82406f943d449d522d88baa554515e0f.tar.gz
+sha256  c98201dffc51addf4157ceb67f2ef7f2c0f3813e49342834f243244a872d90c1  leafnode2-2.0.0.alpha202601.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 8c44071209..3e11a65a70 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = 9543ffaf82406f943d449d522d88baa554515e0f
-LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,$(LEAFNODE2_VERSION))
+LEAFNODE2_VERSION = 2.0.0.alpha202601
+LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,leafnode-$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
-LEAFNODE2_DEPENDENCIES = host-pcre pcre
+LEAFNODE2_DEPENDENCIES = host-pcre2 pcre2
 LEAFNODE2_AUTORECONF = YES
 
 # pod2man doesn't work when cross compiling
@@ -18,7 +18,7 @@ endef
 LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
 
 LEAFNODE2_CONF_ENV = \
-	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
+	PCRE2CONFIG="$(STAGING_DIR)/usr/bin/pcre2-config"
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 LEAFNODE2_DEPENDENCIES += libxcrypt
@@ -35,13 +35,13 @@ LEAFNODE2_CONF_OPTS = \
 # Leafnode2 needs the host version of b_sortnl during
 # compilation. Instead of creating a separate host package and
 # installing b_sortnl to $(HOST_DIR) this binary is compiled
-# on-the-fly, host-pcre is needed for this
+# on-the-fly, host-pcre2 is needed for this
 define LEAFNODE2_BUILD_SORTNL_TOOL
 	cd $(@D); \
 	$(HOSTCC) $(HOST_CFLAGS) -o b_sortnl_host \
 		arc4random.c mergesort.c b_sortnl.c critmem_malloc.c \
 		critmem_realloc.c -DHAVE_CONFIG_H -I$(HOST_DIR)/include \
-		-L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib -lpcre
+		-L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib -lpcre2-8
 endef
 
 LEAFNODE2_PRE_BUILD_HOOKS += LEAFNODE2_BUILD_SORTNL_TOOL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
