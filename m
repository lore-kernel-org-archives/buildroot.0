From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jul 2014 09:20:16 -0300
Subject: [Buildroot] [PATCH] openswan: needs host-flex
Message-ID: <1405945216-16901-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although parser.l is shipped it seems it might get regenerated from
parser.y sometimes and an old installed flex might not be good enough.
Fixes:
http://autobuild.buildroot.net/results/e59/e5970eae28d01503d89a5d4e593711d7a27da8b5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 4d82b49..ce5bdfb 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -9,7 +9,7 @@ OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
-OPENSWAN_DEPENDENCIES = host-bison gmp iproute2
+OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
 OPENSWAN_MAKE_OPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
 	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
 	USE_KLIPS=false USE_MAST=false USE_NM=false
-- 
1.8.5.5
