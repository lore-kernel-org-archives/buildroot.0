From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 17:28:05 +0200
Subject: [Buildroot] [git commit] manual: fix spelling mistakes
Message-ID: <20140601200640.B3FC49CE46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3b4369848e4a4349884499abe9a40f7666389bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt   |    2 +-
 docs/manual/adding-packages-luarocks.txt    |    4 ++--
 docs/manual/adding-packages-virtual.txt     |    2 +-
 docs/manual/configure.txt                   |    6 +++---
 docs/manual/make-tips.txt                   |    2 +-
 docs/manual/using-buildroot-development.txt |    2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 3cf3afa..f735244 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -27,7 +27,7 @@ config BR2_PACKAGE_LIBFOO
 	  http://foosoftware.org/libfoo/
 ---------------------------
 
-The +bool+ line, +help+ line and other meta-informations about the
+The +bool+ line, +help+ line and other meta-information about the
 configuration option must be indented with one tab. The help text
 itself should be indented with one tab and two spaces, and it must
 mention the upstream URL of the project.
diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index 766a4fe..f307e4d 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -49,7 +49,7 @@ package to be built.
 ==== +luarocks-package+ reference
 
 LuaRocks is a deployment and management system for Lua modules, and supports
-various +build.type+: +builtin+, +make+ and +cmake+. In the contetx of
+various +build.type+: +builtin+, +make+ and +cmake+. In the context of
 Buildroot, the +luarocks-package+ infrastructure only supports the +builtin+
 mode. LuaRocks packages that use the +make+ or +cmake+ build mechanisms
 should instead be packaged using the +generic-package+ and +cmake-package+
@@ -57,7 +57,7 @@ infrastructures in Buildroot, respectively.
 
 The main macro of the LuaRocks package infrastructure is +luarocks-package+:
 like +generic-package+ it works by defining a number of variables providing
-meta informations about the package, and then calling +luarocks-package+. It
+meta information about the package, and then calling +luarocks-package+. It
 is worth mentioning that building LuaRocks packages for the host is not
 supported, so the macro +host-luarocks-package+ is not implemented.
 
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index 0cbe753..6326bb5 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -12,7 +12,7 @@ the provider used in the rootfs.
 
 For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
 The implementation of this API is different for the 'Allwinner Tech Sunxi' and
-the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
+the 'Texas Instruments OMAP35xx' platforms. So +libgles+ will be a virtual
 package and +sunxi-mali+ and +ti-gfx+ will be the providers.
 
 ==== +virtual-package+ tutorial
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index da4bdb0..eb8cb1d 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -230,7 +230,7 @@ different solutions to handle the +/dev+ directory :
  * The first solution is *Static using device table*. This is the old
    classical way of handling device files in Linux. With this method,
    the device files are persistently stored in the root filesystem
-   (i.e. they persist accross reboots), and there is nothing that will
+   (i.e. they persist across reboots), and there is nothing that will
    automatically create and remove those device files when hardware
    devices are added or removed from the system. Buildroot therefore
    creates a standard set of device files using a _device table_, the
@@ -257,14 +257,14 @@ different solutions to handle the +/dev+ directory :
    possible to use this option). When mounted in +/dev+, this virtual
    filesystem will automatically make _device files_ appear and
    disappear as hardware devices are added and removed from the
-   system. This filesystem is not persistent accross reboots: it is
+   system. This filesystem is not persistent across reboots: it is
    filled dynamically by the kernel. Using _devtmpfs_ requires the
    following kernel configuration options to be enabled:
    +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+. When Buildroot is in
    charge of building the Linux kernel for your embedded device, it
    makes sure that those two options are enabled. However, if you
    build your Linux kernel outside of Buildroot, then it is your
-   responsability to enable those two options (if you fail to do so,
+   responsibility to enable those two options (if you fail to do so,
    your Buildroot system will not boot).
 
  * The third solution is *Dynamic using mdev*. This method also relies
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 9fabb6f..281b628 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -67,7 +67,7 @@ The manual outputs will be generated in 'output/docs/manual'.
 - A few tools are required to build the documentation (see:
   xref:requirement-optional[]).
 
-.Reseting Buildroot for a new target:
+.Resetting Buildroot for a new target:
 
 To delete all build products as well as the configuration:
 
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index e51e1a6..2ecff35 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -57,7 +57,7 @@ any other version control system. To achieve this, Buildroot will use
 _rsync_ to copy the source code of the component from the specified
 +<pkg>_OVERRIDE_SRCDIR+ to +output/build/<package>-custom/+.
 
-This mechanism is best used in conjuction with the +make
+This mechanism is best used in conjunction with the +make
 <pkg>-rebuild+ and +make <pkg>-reconfigure+ targets. A +make
 <pkg>-rebuild all+ sequence will _rsync_ the source code from
 +<pkg>_OVERRIDE_SRCDIR+ to +output/build/<package>-custom+ (thanks to
