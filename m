From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:19:43 +0200
Subject: [Buildroot] [git commit] openpowerlink: do not override
	CMAKE_BUILD_TYPE
Message-ID: <20140601202128.561AD9CE48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bccca5a0e27412d9fbeb82fe5d78891a13d529aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openpowerlink/openpowerlink.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 152f014..a888eb3 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -25,12 +25,6 @@ OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
 # so force static lib to build libpowerlink.a
 OPENPOWERLINK_CONF_OPT += -DBUILD_SHARED_LIBS=OFF
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
-OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Debug
-else
-OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Release
-endif
-
 OPENPOWERLINK_CONF_OPT += -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
