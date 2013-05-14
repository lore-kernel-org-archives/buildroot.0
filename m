From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 12:34:20 +0200
Subject: [Buildroot] [git commit] fan-ctrl: needs MMU support
Message-ID: <20130514103519.DF7A89A1D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=569144696126610d83237bcf63c90dbc49aee0ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/333/333b6caa6b8a9a04495d82d02b2c0fb7755667ed/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fan-ctrl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
index 392904c..8696316 100644
--- a/package/fan-ctrl/Config.in
+++ b/package/fan-ctrl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FAN_CTRL
 	bool "fan-ctrl"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Fan-ctrl is a little daemon that controls the speed of one
 	  or more system or CPU fans. It does so by monitoring
