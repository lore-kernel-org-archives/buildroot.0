From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  4 Oct 2018 22:48:24 +0200
Subject: [Buildroot] [PATCH v2 3/3] wireless-regdb: use BR2_KERNEL_MIRROR
 for download site
In-Reply-To: <20181004204824.17274-1-ps.report@gmx.net>
References: <20181004204824.17274-1-ps.report@gmx.net>
Message-ID: <20181004204824.17274-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch (suggested by Baruch Siach)
---
 package/wireless-regdb/wireless-regdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9c899f973b..c509c7c7f8 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -6,7 +6,7 @@
 
 WIRELESS_REGDB_VERSION = 2018.09.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
-WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
+WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
-- 
2.19.0
