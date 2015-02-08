From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  9 Feb 2015 00:22:09 +0100
Subject: [Buildroot] [PATCH 2/3] package/openvmtools: fix syncDriverPosix
In-Reply-To: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1423437730-22997-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch from Fedora

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openvmtools/0007-sizeof_argument.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/openvmtools/0007-sizeof_argument.patch

diff --git a/package/openvmtools/0007-sizeof_argument.patch b/package/openvmtools/0007-sizeof_argument.patch
new file mode 100644
index 0000000..ec2a3f6
--- /dev/null
+++ b/package/openvmtools/0007-sizeof_argument.patch
@@ -0,0 +1,18 @@
+Patch from Fedora:
+
+http://pkgs.fedoraproject.org/cgit/open-vm-tools.git/commit/sizeof_argument.patch?id=3031fb5279096189aeb50d197b02313c12d701f3
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+
+--- open-vm-tools-9.4.6-1770165.orig/lib/syncDriver/syncDriverPosix.c	2014-07-15 13:42:21.043818478 -0700
++++ open-vm-tools-9.4.6-1770165/lib/syncDriver/syncDriverPosix.c	2014-07-15 13:55:41.724103304 -0700
+@@ -72,8 +72,7 @@
+    size_t i;
+ 
+    for (i = 0; i < ARRAYSIZE(gRemoteFSTypes); i++) {
+-      if (Str_Strncmp(fsType, gRemoteFSTypes[i],
+-                      sizeof gRemoteFSTypes[i]) == 0) {
++      if (Str_Strcmp(gRemoteFSTypes[i], fsType) == 0) {
+          return TRUE;
+       }
+    }
-- 
1.9.3
