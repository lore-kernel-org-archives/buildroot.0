From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 22:53:53 +0200
Subject: [Buildroot] [PATCH] system: add help entry to "none" init system
Message-ID: <1464382433-30794-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It can be a little bit misleading to have no init system...

Add a comment that states the user has to provide his own init system,
either via a package or a rootfs overlay.

It is expected that such a user will know what to provide, so we don't
really need to specify that it should be /init or /sbin/init or any
arbitrary executable pointed to by the kernel command line "init=..."
or anything else...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 1820029..608c18e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -102,6 +102,10 @@ comment "systemd needs (e)glibc toolchain, headers >= 3.10"
 
 config BR2_INIT_NONE
 	bool "None"
+	help
+	  Buildroot will not install any init system. You will
+	  have to provide your own, either with a new package
+	  or with a rootfs-overlay.
 
 endchoice
 
-- 
2.7.4
