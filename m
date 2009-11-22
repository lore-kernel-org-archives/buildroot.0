From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] docs/buildroot.html: document
	linux26-menuconfig / LINUX26_KCONFIG
Message-ID: <20091122210626.93DDD777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=796e2b6cccfe39e0a049871c3daff073cde00174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This wasn't menitioned in the documentation as noticed by
Grant Edwards <grant.b.edwards@gmail.com>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index d56b663..a04348b 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -29,6 +29,8 @@
       configuration</a></li>
       <li><a href="#custom_uclibc">Customizing the uClibc
       configuration</a></li>
+      <li><a href="#custom_linux26">Customizing the Linux kernel
+      configuration</a></li>
       <li><a href="#rebuilding_packages">Understanding how to rebuild packages</a></li>
       <li><a href="#buildroot_innards">How Buildroot works</a></li>
       <li><a href="#using_toolchain">Using the uClibc toolchain
@@ -269,6 +271,8 @@
     internal toolchain is selected</li>
     <li><code>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path
     to the Busybox configuration file</li>
+    <li><code>LINUX26_KCONFIG=&lt;path/to/.config&gt;</code>, path
+    to the Linux kernel configuration file</li>
     <li><code>BUILDROOT_COPYTO</code>, an additional location at which
     the binary images of the root filesystem, kernel, etc. built by
     Buildroot are copied</li>
@@ -414,6 +418,18 @@ $ export BUILDROOT_COPYTO=/tftpboot
     <p>If you want to use an existing config file for uclibc, then see
     section <a href="#environment_variables">environment variables</a>. </p>
 
+    <h2><a name="custom_linux26" id="custom_linux26"></a>Customizing
+    the Linux kernel configuration</h2>
+
+    <p>The Linux kernel configuration can be customized just like <a
+    href="#custom_busybox">BusyBox</a> and <a href="#custom_uclibc">uClibc</a>
+    using <code>make linux26-menuconfig</code>. Make sure you have
+    enabled the kernel build in <code>make menuconfig</code> first.
+    Once done, run <code>make</code> to (re)build everything.</p>
+
+    <p>If you want to use an existing config file for Linux, then see
+    section <a href="#environment_variables">environment variables</a>.</p>
+
     <h2><a name="#rebuilding_packages"
     id="rebuilding_packages">Understanding how to rebuild
     packages</a></h2>
-- 
1.6.3.3
