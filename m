From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2014 22:06:42 +0100
Subject: [Buildroot] [git commit] fswebcam: needs mmu
Message-ID: <20140130212934.C001D9C6E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e05a1285f6044cec29b8ca30424413198950bc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/62b/62b74b3c8024f362035003450676bfcc36c7171a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fswebcam/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
index 7724639..a894d3b 100644
--- a/package/fswebcam/Config.in
+++ b/package/fswebcam/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FSWEBCAM
 	bool "fswebcam"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
