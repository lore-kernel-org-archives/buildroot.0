From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:28 +0100
Subject: [Buildroot] [PATCH 09/12] libpcap: bump to 1.1.1
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-10-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

This new release avoids problems when running autoreconf.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libpcap/libpcap-1.0.0-wireless.patch |   26 --------------------------
 package/libpcap/libpcap.mk                   |    2 +-
 2 files changed, 1 insertions(+), 27 deletions(-)
 delete mode 100644 package/libpcap/libpcap-1.0.0-wireless.patch

diff --git a/package/libpcap/libpcap-1.0.0-wireless.patch b/package/libpcap/libpcap-1.0.0-wireless.patch
deleted file mode 100644
index 7bcfcda..0000000
--- a/package/libpcap/libpcap-1.0.0-wireless.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH]: pcap-linux: fix build with wireless support
-
-Based on ba23aa7b upstream.
-
-linux/wireless.h includes linux/if.h, which conflicts with net/if.h as
-they both define if* structures. Fix build by simply using linux/if.h
-instead of net/if.h.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- pcap-linux.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libpcap-1.0.0/pcap-linux.c
-===================================================================
---- libpcap-1.0.0.orig/pcap-linux.c
-+++ libpcap-1.0.0/pcap-linux.c
-@@ -93,7 +93,7 @@ static const char rcsid[] _U_ =
- #include <sys/ioctl.h>
- #include <sys/utsname.h>
- #include <sys/mman.h>
--#include <net/if.h>
-+#include <linux/if.h>
- #include <netinet/in.h>
- #include <linux/if_ether.h>
- #include <net/if_arp.h>
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index b14a6f7..eebfc03 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBPCAP_VERSION:=1.0.0
+LIBPCAP_VERSION:=1.1.1
 LIBPCAP_SITE:=http://www.tcpdump.org/release
 LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz
 LIBPCAP_INSTALL_STAGING:=YES
-- 
1.7.2.3
