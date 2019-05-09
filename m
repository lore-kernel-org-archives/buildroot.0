From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 21:25:32 +0200
Subject: [Buildroot] [git commit] package/bind: don't enable server by
 default
Message-ID: <20190509202328.AEB8E88EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39cd8cc9beb119d77a54a9fa7309ead2b18d563e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't enable server by default as dhcp will now select bind to use the
bind libraries

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 60546f691b..6d4ee2e6d7 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -28,7 +28,6 @@ if BR2_PACKAGE_BIND
 
 config BR2_PACKAGE_BIND_SERVER
 	bool "Install server components"
-	default y
 	help
 	  Install server components (named, lwresd)
 
