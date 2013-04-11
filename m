From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:01:18 +0200
Subject: [Buildroot] [git commit] libev: also fails for blackfin
Message-ID: <20130411140827.9152F9B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52763c16bec40fcf007122d355aeab6f3412e24f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fails for blackfin because of a lack of memory fences so disable
it. Fixes:
http://autobuild.buildroot.net/results/d895f0b0a5f4b6c173c2843a76277e6fe611627b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libev/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libev/Config.in b/package/libev/Config.in
index fd74f55..3d10cd7 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBEV
 	bool "libev"
 	# needs memory fences
-	depends on !BR2_avr32
+	depends on !(BR2_avr32 || BR2_bfin)
 	help
 	  Userspace library for handling asynchronous notifications
 
