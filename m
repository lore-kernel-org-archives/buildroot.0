From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 16:40:28 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: Mention the fact
	that the skeleton location can be configured
Message-ID: <20101124154224.7C8638DCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=49b3ac65607d855889671b27cd6b9f6c1e4f6417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   21 ++++++++-------------
 1 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 44aadf4..1444612 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -335,19 +335,14 @@
       completely rebuild your toolchain and tools, these changes will be
       lost.</li>
 
-      <li>Customize the target filesystem skeleton available under <code>
-      fs/skeleton/</code>. You can customize configuration files or other
-      stuff here. However, the full file hierarchy is not yet present
-      because it's created during the compilation process. Therefore, you
-      can't do everything on this target filesystem skeleton, but changes to
-      it do remain even if you completely rebuild the cross-compilation
-      toolchain and the tools. <br /> You can also customize the <code>
-      target/generic/device_table.txt</code> file, which is used by the
-      tools that generate the target filesystem image to properly set
-      permissions and create device nodes.<br /> These customizations are
-      deployed into <code>output/target/</code> just before the actual image
-      is made. Simply rebuilding the image by running make should propagate
-      any new changes to the image.</li>
+      <li>Create your own <i>target skeleton</i>. You can start with
+      the default skeleton available under <code>fs/skeleton</code>
+      and then customize it to suit your
+      needs. The <code>BR2_ROOTFS_SKELETON_CUSTOM</code>
+      and <code>BR2_ROOTFS_SKELETON_CUSTOM_PATH</code> will allow you
+      to specify the location of your custom skeleton. At build time,
+      the contents of the skeleton are copied to output/target before
+      any package installation.</li>
 
       <li>Add support for your own target in Buildroot, so that you
       have your own target skeleton (see <a href="#board_support">this
-- 
1.7.2.2
