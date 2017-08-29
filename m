From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Aug 2017 08:03:11 +0300
Subject: [Buildroot] [PATCH next 1/2] dnsmasq: bump to version 2.77
Message-ID: <1026a6ca932ca0b0fca113a766ecd2d5d3ad89c7.1503982992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supported Lua version is now 5.2.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dnsmasq/dnsmasq.hash | 3 ++-
 package/dnsmasq/dnsmasq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index a73e911a2654..f7e9190f2390 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	4b92698dee19ca0cb2a8f2e48f1d2dffd01a21eb15d1fbed4cf085630c8c9f96	dnsmasq-2.76.tar.xz
+# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.77.tar.xz.asc
+sha256	6eac3b1c50ae25170e3ff8c96ddb55236cf45007633fdb8a35b1f3e02f5f8b8a	dnsmasq-2.77.tar.xz
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 63295ce41090..ffbbeb8f8768 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.76
+DNSMASQ_VERSION = 2.77
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
@@ -58,7 +58,7 @@ DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
 define DNSMASQ_ENABLE_LUA
-	$(SED) 's/lua5.1/lua/g' $(DNSMASQ_DIR)/Makefile
+	$(SED) 's/lua5.2/lua/g' $(DNSMASQ_DIR)/Makefile
 	$(SED) 's^.*#define HAVE_LUASCRIPT.*^#define HAVE_LUASCRIPT^' \
 		$(DNSMASQ_DIR)/src/config.h
 endef
-- 
2.14.1
