From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 26 Feb 2017 11:51:27 +0100
Subject: [Buildroot] [PATCH] libpcap: sparc needs -fPIC as sparc64/microblaze
Message-ID: <20170226105127.GA19192@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes nmap build for sparc.

Fixes:
 http://autobuild.buildroot.net/results/8e476939f1daaa20c316dbd0508fa343034f2397

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libpcap/libpcap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 2583087..505e2ab 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -53,8 +53,8 @@ else
 LIBPCAP_CONF_OPTS += --without-libnl
 endif
 
-# microblaze/sparc64 need -fPIC instead of -fpic
-ifeq ($(BR2_microblaze)$(BR2_sparc64),y)
+# microblaze/sparc/sparc64 need -fPIC instead of -fpic
+ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
 LIBPCAP_CFLAGS += -fPIC
 endif
 
-- 
2.1.4
