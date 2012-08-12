From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:49 +0200
Subject: [Buildroot] [PATCH 01/36] system/init: add option for no init system
Message-ID: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can be usefull if a local package provides an init procedure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
1.7.2.5
