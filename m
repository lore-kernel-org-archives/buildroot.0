Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757EFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BA642095;
	Fri, 10 Dec 2021 19:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsRuxBuhUlLM; Fri, 10 Dec 2021 19:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F7442163;
	Fri, 10 Dec 2021 19:13:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0091BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D700412D1
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLZIqlZ79suW for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D719F412CA
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1F9AE8255D; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 19:28:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4910a175b3f1f4b55ff257a75945d8ffb14a4ceb
X-Git-Newrev: 075b01f2f7b5a9241b4bfe76db8f14af0284060c
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.1F9AE8255D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: bump to version 2.4.9
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
Content-Type: multipart/mixed; boundary="===============2072226125435791446=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2072226125435791446==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=075b01f2f7b5a9241b4bfe76db8f14af0284060c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of bsd-comp.c, ccp.c and passprompt.c (no change in
  license)
- rp-pppoe has been renamed to pppoe since
  https://github.com/paulusmack/ppp/commit/b2c36e6c0e1655aea9b1b0a03a8160f42a26c884
- Manage EAP-TLS which depends on openssl and has been added and is
  enabled by default since
  https://github.com/paulusmack/ppp/commit/e87fe1bbd37a1486c5223f110e9ce3ef75971f93
  It should be noted that openssl is still mandatory with glibc because
  encrypt and setkey have been removed since version 2.28 (see commit
  b519bcafe75d1256d1fc42aa26393405b89629b3)
- musl is now supported
- Update indentation in hash file (two spaces)

https://github.com/paulusmack/ppp/blob/2.4.9/README

Fixes:
 - https://bugs.busybox.net/show_bug.cgi?id=13436

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/network-manager/Config.in                  |  4 --
 package/pppd/0001-pppd-Fix-bounds-check.patch      | 37 -------------
 ...lation-with-older-glibc-or-kernel-headers.patch | 60 ++++++++++++++++++++++
 package/pppd/Config.in                             |  5 +-
 package/pppd/pppd.hash                             | 12 ++---
 package/pppd/pppd.mk                               | 19 +++----
 package/rp-pppoe/Config.in                         |  5 +-
 7 files changed, 80 insertions(+), 62 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 2534963918..a48cb37b15 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -45,14 +45,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 
 config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	bool "pppd support"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # pppd
 	select BR2_PACKAGE_PPPD
 	help
 	  This option enables support for PPPD daemon
 
-comment "pppd support needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	bool "OpenVSwitch support"
 	select BR2_PACKAGE_JANSSON
diff --git a/package/pppd/0001-pppd-Fix-bounds-check.patch b/package/pppd/0001-pppd-Fix-bounds-check.patch
deleted file mode 100644
index 5d7c51bcac..0000000000
--- a/package/pppd/0001-pppd-Fix-bounds-check.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8d7970b8f3db727fe798b65f3377fe6787575426 Mon Sep 17 00:00:00 2001
-From: Paul Mackerras <paulus@ozlabs.org>
-Date: Mon, 3 Feb 2020 15:53:28 +1100
-Subject: [PATCH] pppd: Fix bounds check in EAP code
-
-Given that we have just checked vallen < len, it can never be the case
-that vallen >= len + sizeof(rhostname).  This fixes the check so we
-actually avoid overflowing the rhostname array.
-
-Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
-Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
----
- pppd/eap.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pppd/eap.c b/pppd/eap.c
-index 94407f56..1b93db01 100644
---- a/pppd/eap.c
-+++ b/pppd/eap.c
-@@ -1420,7 +1420,7 @@ int len;
- 		}
- 
- 		/* Not so likely to happen. */
--		if (vallen >= len + sizeof (rhostname)) {
-+		if (len - vallen >= sizeof (rhostname)) {
- 			dbglog("EAP: trimming really long peer name down");
- 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
- 			rhostname[sizeof (rhostname) - 1] = '\0';
-@@ -1846,7 +1846,7 @@ int len;
- 		}
- 
- 		/* Not so likely to happen. */
--		if (vallen >= len + sizeof (rhostname)) {
-+		if (len - vallen >= sizeof (rhostname)) {
- 			dbglog("EAP: trimming really long peer name down");
- 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
- 			rhostname[sizeof (rhostname) - 1] = '\0';
diff --git a/package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch b/package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch
new file mode 100644
index 0000000000..86d8b8f4e3
--- /dev/null
+++ b/package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch
@@ -0,0 +1,60 @@
+From 98ec18f098e5ef68e3a8cc6954fcaf5a7fb8b7be Mon Sep 17 00:00:00 2001
+From: pali <7141871+pali@users.noreply.github.com>
+Date: Mon, 15 Feb 2021 07:54:01 +0100
+Subject: [PATCH] pppd: Fix compilation with older glibc or kernel headers
+ (#248)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc versions prior to 2.24 do not define SOL_NETLINK and linux kernel
+versions prior to 4.3 do not define NETLINK_CAP_ACK. So add fallback
+definitions for these macros into pppd/sys-linux.c file.
+
+Also extend description why we call SOL_NETLINK/NETLINK_CAP_ACK option.
+
+Signed-off-by: Pali Rohár <pali@kernel.org>
+
+[Retrieved from:
+https://github.com/ppp-project/ppp/commit/98ec18f098e5ef68e3a8cc6954fcaf5a7fb8b7be]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pppd/sys-linux.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index 85033d97..50c4f2da 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -125,6 +125,14 @@
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/if_addr.h>
++/* glibc versions prior to 2.24 do not define SOL_NETLINK */
++#ifndef SOL_NETLINK
++#define SOL_NETLINK 270
++#endif
++/* linux kernel versions prior to 4.3 do not define/support NETLINK_CAP_ACK */
++#ifndef NETLINK_CAP_ACK
++#define NETLINK_CAP_ACK 10
++#endif
+ #endif
+ 
+ #include "pppd.h"
+@@ -2843,7 +2851,15 @@ static int append_peer_ipv6_address(unsigned int iface, struct in6_addr *local_a
+     if (fd < 0)
+         return 0;
+ 
+-    /* do not ask for error message content */
++    /*
++     * Tell kernel to not send to us payload of acknowledgment error message.
++     * NETLINK_CAP_ACK option is supported since Linux kernel version 4.3 and
++     * older kernel versions always send full payload in acknowledgment netlink
++     * message. We ignore payload of this message as we need only error code,
++     * to check if our set remote peer address request succeeded or failed.
++     * So ignore return value from the following setsockopt() call as setting
++     * option NETLINK_CAP_ACK means for us just a kernel hint / optimization.
++     */
+     one = 1;
+     setsockopt(fd, SOL_NETLINK, NETLINK_CAP_ACK, &one, sizeof(one));
+ 
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 66c935abb1..ca139a50e9 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PPPD
 	bool "pppd"
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL \
@@ -40,6 +39,6 @@ config BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF
 
 endif
 
-comment "pppd needs a uClibc or glibc toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+comment "pppd needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index a923158576..3d471695bb 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,7 +1,7 @@
 # Locally calculated
-sha256	91fbff784ad16a1111a7f22df4675aeb161d958bb79f1cc4c1f0c81944e7cb40	pppd-2.4.8.tar.gz
-sha256	3990c65c506885f7bb75455d1d6188743a14ad46f5b62e136ef3739aed52c532	pppd/tdb.c
-sha256	1822ead9d2854adfbd282322b29730a3fec4cc67f6f6a2e487aad3476e3afd59	pppd/plugins/pppoatm/COPYING
-sha256	91a5e9c173e0e001e081e15bf7850cfd782a0baa02f5921e327ae3b449beff3f	pppdump/bsd-comp.c
-sha256	ee1c28551c87cdcdaf80eb3922726f015201614cb560a5ed18a7a0c15f2b4aa4	pppd/ccp.c
-sha256	6fa4c3dad059f6ef15c1c5e5219d9d0d40991dd3a162098a89967a1720de059e	pppd/plugins/passprompt.c
+sha256  675bff4f366174649f4a3c92fd32ac476e694164ff2b0b7710019b6ead9c561e  pppd-2.4.9.tar.gz
+sha256  3990c65c506885f7bb75455d1d6188743a14ad46f5b62e136ef3739aed52c532  pppd/tdb.c
+sha256  1822ead9d2854adfbd282322b29730a3fec4cc67f6f6a2e487aad3476e3afd59  pppd/plugins/pppoatm/COPYING
+sha256  d759ec16875a69c2d5529f8cb3c040fef8fe38d26f70457aadb73c91b72746c8  pppdump/bsd-comp.c
+sha256  c0d0f14b6ec9948332f10ded741293ed1f3b96e0d266e4903b605a6e1f8af7cd  pppd/ccp.c
+sha256  367f334c509db2b293aea5ce9f54284d9a9f6e0a9e0c6e305d544079baf8ab63  pppd/plugins/passprompt.c
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 098c6a8e6f..71bfceb607 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPPD_VERSION = 2.4.8
+PPPD_VERSION = 2.4.9
 PPPD_SITE = $(call github,paulusmack,ppp,ppp-$(PPPD_VERSION))
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
@@ -14,14 +14,15 @@ PPPD_CPE_ID_VENDOR = samba
 PPPD_CPE_ID_PRODUCT = ppp
 PPPD_SELINUX_MODULES = ppp
 
-# 0001-pppd-Fix-bounds-check.patch
-PPPD_IGNORE_CVES += CVE-2020-8597
-
 PPPD_MAKE_OPTS = HAVE_INET6=y
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PPPD_DEPENDENCIES += openssl
+PPPD_MAKE_OPTS += USE_EAPTLS=y
 else
-PPPD_MAKE_OPTS += USE_CRYPT=y
+PPPD_MAKE_OPTS += \
+	USE_CRYPT=y \
+	USE_EAPTLS=
 endif
 
 PPPD_INSTALL_STAGING = YES
@@ -101,9 +102,9 @@ define PPPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/passwordfd.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppoatm/pppoatm.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppoatm.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/rp-pppoe/rp-pppoe.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/rp-pppoe.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/rp-pppoe/pppoe-discovery \
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppoe/pppoe.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppoe.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppoe/pppoe-discovery \
 		$(TARGET_DIR)/usr/sbin/pppoe-discovery
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/winbind.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/winbind.so
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 12f981d8c7..2ac81cbb2d 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,11 +1,10 @@
-comment "rp-pppoe needs a uClibc or glibc toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+comment "rp-pppoe needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # pppd
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PPPD
 	help

--===============2072226125435791446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2072226125435791446==--
