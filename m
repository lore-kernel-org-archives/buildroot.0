From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Mar 2011 11:56:03 +0100
Subject: [Buildroot] [git commit master 1/1] xerces: add optional libcurl
	support
Message-ID: <20110302105645.932078B635@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=764d844fbc20721b7be0c3b9328cbe130079a0ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xerces/xerces.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 9a22499..ffd874b 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -10,7 +10,6 @@ XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPT = --enable-shared \
 		  --disable-threads \
-		  --disable-network \
 		  --with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
@@ -18,4 +17,11 @@ XERCES_CONF_ENV += LIBS=-liconv
 XERCES_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+XERCES_CONF_OPT += --enable-netaccessor-curl
+XERCES_DEPENDENCIES += libcurl
+else
+XERCES_CONF_OPT += --disable-network
+endif
+
 $(eval $(call AUTOTARGETS,package,xerces))
-- 
1.7.3.4
