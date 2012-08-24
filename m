From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 00:05:22 +0200
Subject: [Buildroot] [git commit] system/init: add option for no init system
Message-ID: <20120824221101.F08EA99363@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c00636e8bbc4e4c3049e2e4a2e2e9da25ef5589
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Can be usefull if a local package provides an init procedure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/generic/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index a83ba44..b8472f4 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -64,6 +64,9 @@ comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
 		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
 
+config BR2_INIT_NONE
+	bool "None"
+
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
