From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:44 -0000
Subject: [Buildroot] [git commit branch/next] libconfig: don't build examples
Message-ID: <20120802195243.AD55396EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e065b0ecd548c7c3ea6069b50f183dd2fc85a1b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes (works around)

http://autobuild.buildroot.net/results/2378161d70beade94547a68eeeaa69e34705baf2

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libconfig/libconfig.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 8ef927b..f81f419 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -6,9 +6,10 @@
 LIBCONFIG_VERSION = 1.4.8
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
 LIBCONFIG_INSTALL_STAGING = YES
+LIBCONFIG_CONF_OPT = --disable-examples
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBCONFIG_CONF_OPT = --disable-cxx
+LIBCONFIG_CONF_OPT += --disable-cxx
 endif
 
 $(eval $(call AUTOTARGETS))
