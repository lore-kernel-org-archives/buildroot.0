From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:37 -0300
Subject: [Buildroot] [PATCH 4/9] legacy: add weston rpi support
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's gone for good, people should just use the open vc4 support instead.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index d105601..2fae812 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_WESTON_RPI
+	bool "Weston propietary RPI support is gone"
+	select BR2_LEGACY
+	help
+	  Upstream decided the propietary (rpi-userland) weston composer
+	  support wasn't worth the effort so it was removed. Switch to
+	  the open VC4 support.
+
 config BR2_LINUX_KERNEL_TOOL_CPUPOWER
 	bool "linux-tool cpupower"
 	depends on BR2_LINUX_KERNEL
-- 
2.7.3
