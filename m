From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:36 -0000
Subject: [Buildroot] [git commit branch/next] pptp-linux: fix build with
	high BR2_JLEVEL settings
Message-ID: <20120802195234.8639D96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffc4afe084a76e7246bd373c73b706f512a86c2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pptp-linux build system is not robust against parallel builds.

Fixes http://autobuild.buildroot.net/results/a75fab3f04d03cb39cd41a86b6f57307198ba5f1

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pptp-linux/pptp-linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 77ae34d..d4c5bc4 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -7,6 +7,7 @@
 PPTP_LINUX_VERSION = 1.7.2
 PPTP_LINUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pptpclient
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
+PPTP_LINUX_MAKE = $(MAKE1)
 
 define PPTP_LINUX_BUILD_CMDS
 	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
