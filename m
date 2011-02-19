From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Feb 2011 23:52:40 +0100
Subject: [Buildroot] [git commit master 1/1] libmicrohttpd: bump version
Message-ID: <20110219225351.70FDA8F5F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=65600edcaa72a796b131d06fb2cc96cbed98a106
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old 0.4.2 version doesn't seem to be available on the GNU mirrors
anymore, so change to the slightly-less-ancient 0.4.6 version.

We're not moving to the new 0.9.x series yet, as that one needs an
external libgnutls for https support, which we don't have a BR
package for yet.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmicrohttpd/libmicrohttpd.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 626c046..7a1925e 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -3,9 +3,9 @@
 # libmicrohttpd
 #
 #############################################################
-LIBMICROHTTPD_VERSION:=0.4.2
-LIBMICROHTTPD_SOURCE:=libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
-LIBMICROHTTPD_SITE:=$(BR2_GNU_MIRROR)/libmicrohttpd
+LIBMICROHTTPD_VERSION = 0.4.6
+LIBMICROHTTPD_SOURCE = libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
+LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-- 
1.7.3.4
