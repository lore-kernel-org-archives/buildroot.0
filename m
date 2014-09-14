From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 14 Sep 2014 17:48:31 -0300
Subject: [Buildroot] [PATCH] util-linux: disable python for host variant as
	well
Message-ID: <1410727711-32581-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's bindings, and there's no need/use for them. Fixes:
http://autobuild.buildroot.net/results/f3d/f3dfe6bd9031645fb068385af4054c0cc7522b2b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/util-linux.mk | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.8.5.5
