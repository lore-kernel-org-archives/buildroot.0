From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 14:26:31 +0200
Subject: [Buildroot] [PATCH 3/3] package/tinc: bump version to 1.0.28
In-Reply-To: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1463919991-28382-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch can be applied after the release of buildroot 2016.05.

Removed 0001-musl.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinc/0001-musl.patch | 32 --------------------------------
 package/tinc/tinc.hash       |  2 +-
 package/tinc/tinc.mk         |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/tinc/0001-musl.patch

diff --git a/package/tinc/0001-musl.patch b/package/tinc/0001-musl.patch
deleted file mode 100644
index 654c705..0000000
--- a/package/tinc/0001-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From: Jo-Philipp Wich <jow@openwrt.org>
-Date: Thu, 18 Jun 2015 21:58:31 +0000 (+0200)
-Subject: fix musl compatibility
-X-Git-Tag: release-1.0.26~9
-X-Git-Url: http://www.tinc-vpn.org/git/browse?p=tinc;a=commitdiff_plain;h=a04fd9d0c9babca461cee186677db8f607677c6a;hp=bb616245b7883ab30291cd8d46672ed2ae733166
-
-fix musl compatibility
-
-Let configure include sys/if_tun.h when testing for netinet/if_ether.h
-to detect the Kernel/libc header conflict on musl.
-
-After this patch, configure will correctly detect netinet/if_ether.h as
-unusable and the subsequent compilation will not attempt to use it.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(downloaded upstream commit included in tinc 1.0.25:
- http://www.tinc-vpn.org/git/browse?p=tinc;a=commitdiff;h=a04fd9d0c9babca461cee186677db8f607677c6a)
----
-
-diff --git a/src/have.h b/src/have.h
-index e83f98f..69d5100 100644
---- a/src/have.h
-+++ b/src/have.h
-@@ -207,4 +207,8 @@
- #include <resolv.h>
- #endif
- 
-+#ifdef HAVE_LINUX_IF_TUN_H
-+#include <linux/if_tun.h>
-+#endif
-+
- #endif /* __TINC_SYSTEM_H__ */
diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 721b6bd..0cccbbf 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	498e58f9f39e3922030a63cf62baf4b46a40fbda8d90b23ec0f084f4a9f9b687	tinc-1.0.24.tar.gz
+sha256	0b502699360f09ce2128a39cf02abca07bfc699fc02ce829b3a90cf5e1e8b344	tinc-1.0.28.tar.gz
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index f7edd79..cb0785b 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.24
+TINC_VERSION = 1.0.28
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPLv2+ with OpenSSL exception
-- 
2.8.1
