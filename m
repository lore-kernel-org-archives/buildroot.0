Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D59C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC8184A7F;
	Mon, 19 May 2025 11:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzXTBBJ4MKjJ; Mon, 19 May 2025 11:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1270B84A68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1270B84A68;
	Mon, 19 May 2025 11:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B044AE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB46C4203D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHYy6iwAXgo6 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7561940D99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7561940D99
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E75783BC0; Mon, 19 May 2025 10:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:00:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3dbbfdeb8e82d5412b8435341772b8cf30998b3b
X-Git-Newrev: a0a39842e609cc01915b93d7954e3992a2287359
X-Patchwork-Hint: ignore
Message-Id: <20250519104010.6E75783BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{execline, mdevd, s6-*,
 skalibs, tipidee}: bump to October 2024 versions
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
Content-Type: multipart/mixed; boundary="===============3202375319818696146=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3202375319818696146==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a0a39842e609cc01915b93d7954e3992a2287359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Releases have been made to several skarnet.org packages[1]. The biggest
change is that static libraries are installed to /usr/lib by default.

https://skarnet.org/lists/skaware/2098.html

Some COPYRIGHT hashes changed because the copyright years were updated.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/execline.hash                   | 2 +-
 package/execline/execline.mk                     | 4 ++--
 package/mdevd/mdevd.hash                         | 2 +-
 package/mdevd/mdevd.mk                           | 4 ++--
 package/s6-dns/s6-dns.hash                       | 2 +-
 package/s6-dns/s6-dns.mk                         | 4 ++--
 package/s6-linux-init/s6-linux-init.hash         | 4 ++--
 package/s6-linux-init/s6-linux-init.mk           | 4 ++--
 package/s6-linux-utils/s6-linux-utils.hash       | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk         | 4 ++--
 package/s6-networking/s6-networking.hash         | 2 +-
 package/s6-networking/s6-networking.mk           | 4 ++--
 package/s6-portable-utils/s6-portable-utils.hash | 4 ++--
 package/s6-portable-utils/s6-portable-utils.mk   | 4 ++--
 package/s6-rc/s6-rc.hash                         | 2 +-
 package/s6-rc/s6-rc.mk                           | 4 ++--
 package/s6/s6.hash                               | 2 +-
 package/s6/s6.mk                                 | 4 ++--
 package/skalibs/skalibs.hash                     | 2 +-
 package/skalibs/skalibs.mk                       | 2 +-
 package/tipidee/tipidee.hash                     | 2 +-
 package/tipidee/tipidee.mk                       | 4 ++--
 22 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 76412978b9..81a47bd3dc 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ba2a27e97c5eb6bd7ca6a0987a8925e44465a5be996daa0d18f8feca37d7571a  execline-2.9.6.0.tar.gz
+sha256  76919d62f2de4db1ac4b3a59eeb3e0e09b62bcdd9add13ae3f2dad26f8f0e5ca  execline-2.9.6.1.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 45d6b9294f..4d9b668819 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.9.6.0
+EXECLINE_VERSION = 2.9.6.1
 EXECLINE_SITE = https://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
@@ -13,7 +13,7 @@ EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 0151b03bd5..f2667f2643 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7358ce530b6b9befb715e48190981e9b69a12cca858519e6d2e4b46eab7e2470  mdevd-0.1.6.4.tar.gz
+sha256  d5c86420c81b2e4720b41e4f48f727cd5d9a17f4e6317115d21c32099e72a628  mdevd-0.1.6.5.tar.gz
 sha256  701e0e7d93a5da6421f69bed2136d4c64fd4bc17f35221297838a3ad9ba6050e  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index b8d527f1ca..5a3b2a971f 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.6.4
+MDEVD_VERSION = 0.1.6.5
 MDEVD_SITE = https://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ MDEVD_INSTALL_STAGING = YES
 MDEVD_DEPENDENCIES = skalibs
 
 MDEVD_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index dd6e6f3632..29e81e7753 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  6aee32bb68d01f5109f71e31a283213c668cd3c0e79fb9e469e6cabb58079f2b  s6-dns-2.3.7.2.tar.gz
+sha256  4d7ab49c9842ac25b668dc1e2a9260be97757a75f263ce85f9b6556ad2e1dee4  s6-dns-2.4.0.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 4184110096..566cdf21ef 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.7.2
+S6_DNS_VERSION = 2.4.0.0
 S6_DNS_SITE = https://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ S6_DNS_INSTALL_STAGING = YES
 S6_DNS_DEPENDENCIES = skalibs
 
 S6_DNS_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 25292c35b2..78cefb0c65 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  11ae08d0a66210b5e56b6baee0f6b9b1b69fbedb05fda1285b115a31ca46c77f  s6-linux-init-1.1.2.0.tar.gz
-sha256  f68451e55e6686dc187df1ca427c574d9ac0d6f6926e1bdb909ad8b657668fe5  COPYING
+sha256  971e014a229b7f47a128721dd714f8d493c4ac644e465197b6599a9640966530  s6-linux-init-1.1.2.1.tar.gz
+sha256  75b0b50d7bcb9b2fc174d01442536bce03333da1814df3e61cd6ef8f663548f1  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 73f49c49ef..9378a33509 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.1.2.0
+S6_LINUX_INIT_VERSION = 1.1.2.1
 S6_LINUX_INIT_SITE = https://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
 S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
 
 S6_LINUX_INIT_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/execline \
diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 97a67c674e..c01e856948 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  8f944633ca87d3d23e0f03c9c383d1502d508c9bac16d38c3fbf723a5eab2bb7  s6-linux-utils-2.6.2.0.tar.gz
-sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
+sha256  915f167294d36ca9240a62281c7299b5ad5d558b8d45d888761135749d9fd234  s6-linux-utils-2.6.2.1.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index cb1b86c370..f760aec78f 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.6.2.0
+S6_LINUX_UTILS_VERSION = 2.6.2.1
 S6_LINUX_UTILS_SITE = https://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
 S6_LINUX_UTILS_DEPENDENCIES = skalibs
 
 S6_LINUX_UTILS_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 4eff4d49f4..dfc05f03da 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  db411c54371a17ed7d4543dd86cf9530ce25fcf624bef83ae2b579520e5e70bf  s6-networking-2.7.0.3.tar.gz
+sha256  31bdb70c824f58f6cb09d0a568a2454615eeaf498a82896f6c3f8382af590965  s6-networking-2.7.0.4.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 5302ad8ec6..1e2aa5adaa 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.7.0.3
+S6_NETWORKING_VERSION = 2.7.0.4
 S6_NETWORKING_SITE = https://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ S6_NETWORKING_INSTALL_STAGING = YES
 S6_NETWORKING_DEPENDENCIES = s6-dns s6
 
 S6_NETWORKING_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/execline \
diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index 2454e91a4d..790f4e3d32 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  3e4492055d160c25fb90153f0efc277d7d52bf981bbe3ea2e9dfe51c493561ff  s6-portable-utils-2.3.0.3.tar.gz
-sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
+sha256  8dee87b6c89181ef3ed3241fece43f8d79aa137449cae778d3b59e1e91906b08  s6-portable-utils-2.3.0.4.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index bd617ee640..7986e9454e 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.3.0.3
+S6_PORTABLE_UTILS_VERSION = 2.3.0.4
 S6_PORTABLE_UTILS_SITE = https://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
 S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
 
 S6_PORTABLE_UTILS_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 72bd5d42be..052039f98d 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e3272796a947904de37ab34ec10430e26107b8ef05210d81059c8b36203e6a9f  s6-rc-0.5.4.3.tar.gz
+sha256  c3b5f1b8d3acea60a20a59fb25280b69a6aac0bb3afdab21d2edeada77b2df01  s6-rc-0.5.5.0.tar.gz
 sha256  75b0b50d7bcb9b2fc174d01442536bce03333da1814df3e61cd6ef8f663548f1  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 8eddee9c9e..07857708ba 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.4.3
+S6_RC_VERSION = 0.5.5.0
 S6_RC_SITE = https://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ S6_RC_INSTALL_STAGING = YES
 S6_RC_DEPENDENCIES = s6
 
 S6_RC_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/execline \
diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 6abeb8066a..b82b226741 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7e46f8f55d80bb0e2025a64d5d649af4a4ac21e348020caaadde30ba5e5b4830  s6-2.13.0.0.tar.gz
+sha256  bf0614cf52957cb0af04c7b02d10ebd6c5e023c9d46335cbf75484eed3e2ce7e  s6-2.13.1.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index b2451e8454..e72dc28460 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.13.0.0
+S6_VERSION = 2.13.1.0
 S6_SITE = https://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ S6_INSTALL_STAGING = YES
 S6_DEPENDENCIES = execline
 
 S6_CONF_OPTS = \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/execline \
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 1e6bd96671..ba727f9ddd 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ddfec5730e5b2f19d0381ecf7f796b39a6e473236bda0ad8d3776a3fe7b07e43  skalibs-2.14.2.0.tar.gz
+sha256  a14aa558c9b09b062fa16acec623b2c8f93d69f5cba4d07f6d0c58913066c427  skalibs-2.14.3.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 32f7aae864..d37db47b20 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.14.2.0
+SKALIBS_VERSION = 2.14.3.0
 SKALIBS_SITE = https://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
diff --git a/package/tipidee/tipidee.hash b/package/tipidee/tipidee.hash
index ecc1ab34b4..18b2c1600f 100644
--- a/package/tipidee/tipidee.hash
+++ b/package/tipidee/tipidee.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  d9e91fc719879a43d54329b99b02c6649c54e428e77bc96a0573506b52bf1422  tipidee-0.0.5.0.tar.gz
+sha256  228a995683a8cd4a1de9a7cb3f8d83a43830886c687895d0a3d1c5033f90362b  tipidee-0.0.5.1.tar.gz
 sha256  8feb7933c6e6506a7f20fbfc03fd37df3caff4becdf3b7a0ffad5016277e441e  COPYING
diff --git a/package/tipidee/tipidee.mk b/package/tipidee/tipidee.mk
index 8ae18edd8d..035ff50b18 100644
--- a/package/tipidee/tipidee.mk
+++ b/package/tipidee/tipidee.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIPIDEE_VERSION = 0.0.5.0
+TIPIDEE_VERSION = 0.0.5.1
 TIPIDEE_SITE = https://skarnet.org/software/tipidee
 TIPIDEE_LICENSE = ISC
 TIPIDEE_LICENSE_FILES = COPYING
@@ -13,7 +13,7 @@ TIPIDEE_DEPENDENCIES = skalibs
 TIPIDEE_CONF_OPTS = \
 	--prefix=/usr \
 	--sysconfdir=/etc \
-	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \

--===============3202375319818696146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3202375319818696146==--
