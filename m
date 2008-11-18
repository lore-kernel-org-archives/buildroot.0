From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 18 Nov 2008 19:01:52 +0100
Subject: [Buildroot] [PATCH] skeletons patch
Message-ID: <e4c675870811181001u6d5a4643h7dc77efe3dfeae76@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 a) using busybox_skeleton loopback interface is configured two times
in inittab and in interfaces

 b) in both skeletons append /usr/X11R6/bin in PATH does not hurt.


roberto at rafbook:~/gles/buildroot$ cat skeletons.patch
--- target/generic/target_busybox_skeleton/etc/network/interfaces	(revision
24038)
+++ target/generic/target_busybox_skeleton/etc/network/interfaces	(working copy)
@@ -1,4 +1,5 @@
 # Configure Loopback
-auto lo
-iface lo inet loopback
+# In this skeleton happens in inittab
+#auto lo
+#iface lo inet loopback

--- target/generic/target_skeleton/etc/profile	(revision 24038)
+++ target/generic/target_skeleton/etc/profile	(working copy)
@@ -6,6 +6,7 @@
 /usr/bin:\
 /usr/sbin:\
 /usr/bin/X11:\
+/usr/X11R6/bin:\
 /usr/local/bin

 # If running interactively, then:
--- target/generic/target_busybox_skeleton/etc/profile	(revision 24038)
+++ target/generic/target_busybox_skeleton/etc/profile	(working copy)
@@ -6,6 +6,7 @@
 /usr/bin:\
 /usr/sbin:\
 /usr/bin/X11:\
+/usr/X11R6/bin:\
 /usr/local/bin

 # If running interactively, then:


-- 
/roberto
-------------- next part --------------
A non-text attachment was scrubbed...
Name: skeletons.patch
Type: text/x-diff
Size: 834 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081118/682ae6c7/attachment.patch 
