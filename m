From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 11 Dec 2010 02:25:21 +0100
Subject: [Buildroot] [git commit master 1/1] linux: add shorter shortcuts
Message-ID: <20101211012555.BF60D8E25B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=176afdb3a180e0833d8b0a5085a2745e2b3e2d27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only have one Linux kernel package, and "linux26-" is an anachronism
in today's world.  So add useful "linux-%" shortcuts to the "linux26-%".

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/README         |    2 +-
 docs/buildroot.html |    2 +-
 linux/linux.mk      |    3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/README b/docs/README
index c330a60..e756329 100644
--- a/docs/README
+++ b/docs/README
@@ -53,7 +53,7 @@ $ make HOSTCC=gcc-4.3.orig HOSTCXX=gcc-4.3-mine
 
 Depending on your configuration, there are some targets you can use to
 use menuconfig of certain packages. This includes:
-$ make HOSTCC=gcc-4.3 linux26-menuconfig
+$ make HOSTCC=gcc-4.3 linux-menuconfig
 $ make HOSTCC=gcc-4.3 uclibc-menuconfig
 $ make HOSTCC=gcc-4.3 busybox-menuconfig
 
diff --git a/docs/buildroot.html b/docs/buildroot.html
index b6cf578..8293c8f 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -434,7 +434,7 @@
 
     <p>The Linux kernel configuration can be customized just like
     <a href="#custom_busybox">BusyBox</a> and
-    <a href="#custom_uclibc">uClibc</a> using <code>make linux26-menuconfig
+    <a href="#custom_uclibc">uClibc</a> using <code>make linux-menuconfig
     </code>. Make sure you have enabled the kernel build in <code>make
     menuconfig</code> first. Once done, run <code>make</code> to (re)build
     everything.</p>
diff --git a/linux/linux.mk b/linux/linux.mk
index ab90c03..5f89b7d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -179,3 +179,6 @@ endif
 endif
 
 endif
+
+linux-%:
+	$(MAKE) $(subst linux-,linux26-,$@)
-- 
1.7.2.2
