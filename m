Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73267C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222BC6077E;
	Sun, 18 May 2025 14:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N31j-cuS02if; Sun, 18 May 2025 14:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F71607F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F71607F6;
	Sun, 18 May 2025 14:00:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE2D1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D017040855
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkm1tAO3wKdS for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631C44086E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 631C44086E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4583982CE5; Sun, 18 May 2025 14:00:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:00:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ba3e0d8a716b25cce5fc3b0570476d9f72f2690
X-Git-Newrev: 3dbbfdeb8e82d5412b8435341772b8cf30998b3b
X-Patchwork-Hint: ignore
Message-Id: <20250518140050.4583982CE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{execline, mdevd, s6-*,
 skalibs}: remove --prefix=/
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0721103184235284855=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0721103184235284855==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3dbbfdeb8e82d5412b8435341772b8cf30998b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The prefix already defaults to /, so --prefix=/ is unnecessary. An
alternative course of action would be to start setting --prefix=/usr.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/execline.mk                   | 1 -
 package/mdevd/mdevd.mk                         | 1 -
 package/s6-dns/s6-dns.mk                       | 1 -
 package/s6-linux-init/s6-linux-init.mk         | 1 -
 package/s6-linux-utils/s6-linux-utils.mk       | 1 -
 package/s6-networking/s6-networking.mk         | 1 -
 package/s6-portable-utils/s6-portable-utils.mk | 1 -
 package/s6-rc/s6-rc.mk                         | 1 -
 package/s6/s6.mk                               | 1 -
 package/skalibs/skalibs.mk                     | 1 -
 10 files changed, 10 deletions(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 922fc7b5af..45d6b9294f 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -13,7 +13,6 @@ EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index a1d9e17cef..b8d527f1ca 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -12,7 +12,6 @@ MDEVD_INSTALL_STAGING = YES
 MDEVD_DEPENDENCIES = skalibs
 
 MDEVD_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 8e175431a4..4184110096 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -12,7 +12,6 @@ S6_DNS_INSTALL_STAGING = YES
 S6_DNS_DEPENDENCIES = skalibs
 
 S6_DNS_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index ae2bcdb8d8..73f49c49ef 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -11,7 +11,6 @@ S6_LINUX_INIT_LICENSE_FILES = COPYING
 S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
 
 S6_LINUX_INIT_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 04e08c3d43..cb1b86c370 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -11,7 +11,6 @@ S6_LINUX_UTILS_LICENSE_FILES = COPYING
 S6_LINUX_UTILS_DEPENDENCIES = skalibs
 
 S6_LINUX_UTILS_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 212fae7361..5302ad8ec6 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -12,7 +12,6 @@ S6_NETWORKING_INSTALL_STAGING = YES
 S6_NETWORKING_DEPENDENCIES = s6-dns s6
 
 S6_NETWORKING_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 826750f387..bd617ee640 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -11,7 +11,6 @@ S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
 S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
 
 S6_PORTABLE_UTILS_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 301c705910..8eddee9c9e 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -12,7 +12,6 @@ S6_RC_INSTALL_STAGING = YES
 S6_RC_DEPENDENCIES = s6
 
 S6_RC_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 7e02c26d03..b2451e8454 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -12,7 +12,6 @@ S6_INSTALL_STAGING = YES
 S6_DEPENDENCIES = execline
 
 S6_CONF_OPTS = \
-	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 45f3e15a7b..32f7aae864 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -11,7 +11,6 @@ SKALIBS_LICENSE_FILES = COPYING
 SKALIBS_INSTALL_STAGING = YES
 
 SKALIBS_CONF_OPTS = \
-	--prefix=/ \
 	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
 	--with-sysdep-devurandom=yes \
 	$(SHARED_STATIC_LIBS_OPTS)

--===============0721103184235284855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0721103184235284855==--
