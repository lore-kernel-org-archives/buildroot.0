From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 02:50:32 +0300
Subject: [Buildroot] PATCH: set BR2_INET_RPC dependency for nfs-utils and
	portmap
Message-ID: <471159C8.4050603@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set BR2_INET_RPC dependency for nfs-utils and portmap:

Index: package/nfs-utils/Config.in
===================================================================
--- package/nfs-utils/Config.in (revision 20237)
+++ package/nfs-utils/Config.in (working copy)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NFS_UTILS
        bool "nfs-utils"
        default n
+       depends on BR2_INET_RPC
        help
          The NFS Linux kernel server.
          Warning: We do not force largefile support on here on purpose.
Index: package/portmap/Config.in
===================================================================
--- package/portmap/Config.in   (revision 20237)
+++ package/portmap/Config.in   (working copy)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PORTMAP
        bool "portmap"
        default n
+       depends on BR2_INET_RPC
        help
          The standard portmapper for RPC services.



Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
