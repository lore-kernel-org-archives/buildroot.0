From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 10:58:34 +0200
Subject: [Buildroot] [git commit] system: add help entry to "none" init
	system
Message-ID: <20160528085840.E331180DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d185e5ec51bd10ec2e895968e3e2454c7028ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 2e14971..9441467 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -101,6 +101,10 @@ comment "systemd needs (e)glibc toolchain, headers >= 3.10"
 
 config BR2_INIT_NONE
 	bool "None"
+	help
+	  Buildroot will not install any init system. You will
+	  have to provide your own, either with a new package
+	  or with a rootfs-overlay.
 
 endchoice
 
