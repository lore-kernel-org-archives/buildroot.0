From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Oct 2018 19:07:39 +0100
Subject: [Buildroot] [PATCH 1/1] openswan: disable documentation
Message-ID: <20181028180739.3851-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable pod2man and xmlto which are used to build man pages

Fixes:
 - http://autobuild.buildroot.org/results/2268814b8f5a071ecec1aab962b50a1edcb818d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index e3c947317e..ea4446a5f3 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -10,7 +10,7 @@ OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
-OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
+OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
 	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false
-- 
2.17.1
