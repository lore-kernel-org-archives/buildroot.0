From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:45:00 +0200
Subject: [Buildroot] [git commit] xl2tp: drop OpenSSL dependency
Message-ID: <20170902204002.6BA8181E46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f063255acb353cef09ee5f2dd55231cbd85e1800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xl2tp does not depend on OpenSSL since version 1.3.4.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xl2tp/Config.in | 1 -
 package/xl2tp/xl2tp.mk  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index f0b1e83..7e2d2f6 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_OPENSSL
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 7f4ffd4..eee5c04 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -6,7 +6,7 @@
 
 XL2TP_VERSION = v1.3.8
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
-XL2TP_DEPENDENCIES = libpcap openssl
+XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
 XL2TP_LICENSE_FILES = LICENSE
 
