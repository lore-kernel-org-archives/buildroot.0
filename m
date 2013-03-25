From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 08:28:00 +0100
Subject: [Buildroot] [git commit] apr-util: fix incorrect operator leading
	to missing dependencies
Message-ID: <20130325073637.C68C69B2A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=633a5e3cfa9d33b0fe1e4373de6a0f85309dd426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/490a07cc161391b98193ab2c225458effc030ce7/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/apr-util/apr-util.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 94b1817..cc90f9e 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -15,6 +15,6 @@ APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 
 # When iconv is available, then use it to provide charset conversion
 # features.
-APR_UTIL_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(autotools-package))
