From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 11:05:12 +0200
Subject: [Buildroot] [git commit master] Config.in: bump default JLEVEL to 2
Message-ID: <20100331090755.549247F9CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2bbbe05b9a5c694d154a4227956ee0b379f269f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With multicores everywhere, 2 is probably a bit low - But atleast it's
better than the current default.

This extra parallelism also ensures we get to test the make dependencies
a bit more.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 4505578..4f567d0 100644
--- a/Config.in
+++ b/Config.in
@@ -132,7 +132,7 @@ config BR2_GNU_TARGET_SUFFIX
 
 config BR2_JLEVEL
 	int "Number of jobs to run simultaneously"
-	default "1"
+	default "2"
 	help
 	  Number of jobs to run simultaneously
 
-- 
1.6.3.3
