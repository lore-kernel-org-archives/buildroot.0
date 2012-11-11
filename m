From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:15:01 +0100
Subject: [Buildroot] [PATCH 23/23] manual: add beyond-buildroot.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-24-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/beyond-buildroot.txt

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
new file mode 100644
index 0000000..12ce78c
--- /dev/null
+++ b/docs/manual/beyond-buildroot.txt
@@ -0,0 +1,38 @@
+// -*- mode:doc; -*-
+
+Beyond Buildroot
+================
+
+Boot the generated images
+-------------------------
+
+NFS boot
+~~~~~~~~
+
+To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
+images_ menu.
+
+After complete build, just run the following commands to setup the
+NFS-root directory:
+
+-------------------
+sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
+-------------------
+
+Then, you can execute a NFS-boot from your target.
+
+Chroot
+------
+
+If you want to chroot in a generated image, then there are few thing
+you should be aware of:
+
+* you should setup the new root from the _tar root filesystem_ image;
+
+* either the selected target architecture is compatible with your host
+  machine, or you should use some +qemu-*+ binary and correctly set it
+  within the +binfmt+ properties to be able to run the binaries built
+  for the target on your host machine;
+
+* Buildroot does not currently provide +host-qemu+ and +binfmt+
+  correctly built and set for that kind of use.
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index a1ee68a..c34e0ca 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -25,6 +25,8 @@ include::developer-guide.txt[]
 
 include::legal-notice.txt[]
 
+include::beyond-buildroot.txt[]
+
 include::get-involved.txt[]
 
 include::contribute.txt[]
-- 
1.8.0
