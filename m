From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Jun 2015 08:25:03 -0300
Subject: [Buildroot] [PATCH] openvmtools: fix legal info
Message-ID: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In ab71dff0 it was moved to SUBDIR, but this was never reflected for the
legal-info files, update this to fix:
http://autobuild.buildroot.net/results/836/8363943cc9c967713f585209408ea087a052a12d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvmtools/openvmtools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 9819640..e22153b 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -7,7 +7,7 @@
 OPENVMTOOLS_VERSION = stable-9.10.0
 OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
 OPENVMTOOLS_LICENSE = LGPLv2.1
-OPENVMTOOLS_LICENSE_FILES = COPYING
+OPENVMTOOLS_LICENSE_FILES = $(OPENVMTOOLS_SUBDIR)/COPYING
 # Autoreconf needed or config/missing will run configure again at buildtime
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_SUBDIR = open-vm-tools
-- 
2.3.6
