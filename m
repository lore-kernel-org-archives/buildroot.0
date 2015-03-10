From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 10 Mar 2015 19:21:20 +0100
Subject: [Buildroot] [PATCH] lpc3250loader: switch to github
Message-ID: <1426011680-12418-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gitorious is closing end of may. Switch LPC3250Loader to the github
repository.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/lpc3250loader/Config.in.host   | 2 +-
 package/lpc3250loader/lpc3250loader.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lpc3250loader/Config.in.host b/package/lpc3250loader/Config.in.host
index 750080be7c53..9371f13430fe 100644
--- a/package/lpc3250loader/Config.in.host
+++ b/package/lpc3250loader/Config.in.host
@@ -4,4 +4,4 @@ config BR2_PACKAGE_HOST_LPC3250LOADER
 	  lpc3250loader is a tool to load/burn programs (in particular kickstart
 	  and S1L) on an LPC3250 platform.
 
-	  https://gitorious.org/lpc3250loader
+	  https://github.com/alexandrebelloni/lpc3250loader
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index d13ab40170ae..042e364f12cc 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
 HOST_LPC3250LOADER_VERSION = 1.0
+HOST_LPC3250LOADER_SITE = $(call github,alexandrebelloni,lpc3250loader,$(HOST_LPC3250LOADER_VERSION))
 LPC3250LOADER_LICENSE = GPLv2+
 LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
 
-- 
2.1.0
