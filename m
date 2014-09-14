From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 23:00:38 +0200
Subject: [Buildroot] [git commit] util-linux: disable python for host
	variant as well
Message-ID: <20140914211527.EA0F49D65E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7ea16932204b3fd01d0d9597a2016e002337274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's bindings, and there's no need/use for them. Fixes:
http://autobuild.buildroot.net/results/f3d/f3dfe6bd9031645fb068385af4054c0cc7522b2b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 587f57e..7376886 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -27,6 +27,9 @@ UTIL_LINUX_CONF_OPT += \
 # We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
+# We also don't want the host-python dependency
+HOST_UTIL_LINUX_CONF_OPT = --without-python
+
 # If both util-linux and busybox are selected, make certain util-linux
 # wins the fight over who gets to have their utils actually installed
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
