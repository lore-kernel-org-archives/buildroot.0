From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:08:56 +0100
Subject: [Buildroot] [git commit] lpc3250loader: switch to github
Message-ID: <20150310191023.AB80A80136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34cefa79d04c2b588d7f3e2ee98fd7f5ac7dcd99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gitorious is closing end of may. Switch LPC3250Loader to the github
repository.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lpc3250loader/Config.in.host   |    2 +-
 package/lpc3250loader/lpc3250loader.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lpc3250loader/Config.in.host b/package/lpc3250loader/Config.in.host
index 750080b..9371f13 100644
--- a/package/lpc3250loader/Config.in.host
+++ b/package/lpc3250loader/Config.in.host
@@ -4,4 +4,4 @@ config BR2_PACKAGE_HOST_LPC3250LOADER
 	  lpc3250loader is a tool to load/burn programs (in particular kickstart
 	  and S1L) on an LPC3250 platform.
 
-	  https://gitorious.org/lpc3250loader
+	  https://github.com/alexandrebelloni/lpc3250loader
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index d13ab40..042e364 100644
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
 
