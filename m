From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:52:23 +0200
Subject: [Buildroot] [git commit] openswan: needs host-flex
Message-ID: <20140721195331.59F949D2A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6dc395dec0db15b6e43730d4196b7ac6e388e30a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although parser.l is shipped it seems it might get regenerated from
parser.y sometimes and an old installed flex might not be good enough.
Fixes:
http://autobuild.buildroot.net/results/e59/e5970eae28d01503d89a5d4e593711d7a27da8b5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openswan/openswan.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
