From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:57:56 +0100
Subject: [Buildroot] [git commit] libev: disable on avr32
Message-ID: <20121209210013.492F09A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d246aad345cc84caa68e054bf3e353a13b4ab1ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/4951121337fad670d8bf869483774ccf9e91dd47/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libev/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libev/Config.in b/package/libev/Config.in
index 71abe77..fd74f55 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBEV
 	bool "libev"
+	# needs memory fences
+	depends on !BR2_avr32
 	help
 	  Userspace library for handling asynchronous notifications
 
