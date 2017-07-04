From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:46 +0200
Subject: [Buildroot] [git commit] nftables: use the new gettext logic
Message-ID: <20170704233518.212147F8C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4d1d4f5e2564b3ca19ce09fe41c2305c9e44373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nftables/Config.in   | 1 -
 package/nftables/nftables.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index d0a1b89..7c0abe0 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_NFTABLES
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  nftables is the project that aims to replace the existing
 	  {ip,ip6,arp,eb}tables framework.
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 7263ec7..d1e6055 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -8,7 +8,7 @@ NFTABLES_VERSION = 0.7
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
-	host-pkgconf $(if $(BR2_NEEDS_GETTEXT),gettext)
+	host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
 
