From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 23:48:38 +0100
Subject: [Buildroot] [PATCH] apr-util: fix incorrect operator leading to
	missing dependencies
Message-ID: <1364165318-6603-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/490a07cc161391b98193ab2c225458effc030ce7/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/apr-util.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
