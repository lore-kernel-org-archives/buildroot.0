From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 22:18:02 +0200
Subject: [Buildroot] [git commit] lzop: add LZOP definition for the host
	variant
Message-ID: <20130424201904.D81C99B812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60888bbebd624e2582ff0cda62c9c97f74d9d974
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzop/lzop.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1f7c835..9803b39 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -3,6 +3,7 @@
 # lzop
 #
 #############################################################
+
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
@@ -12,3 +13,5 @@ LZOP_DEPENDENCIES = lzo
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+LZOP = $(HOST_DIR)/usr/bin/lzop
