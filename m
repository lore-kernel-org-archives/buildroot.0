From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2014 10:00:23 +0100
Subject: [Buildroot] [git commit] gpm: disable on !MMU, requires fork()
Message-ID: <20140221090041.5942E9A547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b88f2f6159a08ec76eeb78793a45ed6c8bbcb193
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/b2b/b2beb4876fba22f139df9c336ff0fae77354721b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gpm/Config.in b/package/gpm/Config.in
index 2121e71..0a60f6a 100644
--- a/package/gpm/Config.in
+++ b/package/gpm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GPM
 	bool "gpm"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU # fork()
 	help
 	  "gpm" means general purpose mouse (server) and provides mouse support
 	  for Linux virtual consoles.
