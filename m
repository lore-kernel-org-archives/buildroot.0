From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:12:58 +0200
Subject: [Buildroot] [git commit] fan-ctrl: re-enable package
Message-ID: <20150808101404.B21B5816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39f3f4a00ad029624238b500cf9d9843bfa416eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SourceForge is working again, and Peter has copied the file to
fan-ctrl.c on sources.buildroot.org so that it gets found if
SourceForge breaks again. Therefore this commit re-enables the
fan-ctrl package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fan-ctrl/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
index fa23aed..8696316 100644
--- a/package/fan-ctrl/Config.in
+++ b/package/fan-ctrl/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_FAN_CTRL
 	bool "fan-ctrl"
 	depends on BR2_USE_MMU # fork()
-	# SourceForge is down, not backup location, let's disable for
-	# now.
-	depends on BR2_BROKEN
 	help
 	  Fan-ctrl is a little daemon that controls the speed of one
 	  or more system or CPU fans. It does so by monitoring
