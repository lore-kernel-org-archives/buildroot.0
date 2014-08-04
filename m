From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:26:49 +0200
Subject: [Buildroot] [git commit] startup-notification: needs mmu
Message-ID: <20140804162706.62D719D3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c4cf8f6f456886ea85b6057d1dab91485422eab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1fc/1fcb069b790ae5861c5a3ee577689de92005862a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/startup-notification/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 277d300..1fc6dad 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
 	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	help
 	  Startup-notification is a library used to monitor application startup.
 
