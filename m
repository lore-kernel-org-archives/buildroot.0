From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 06:31:46 -0500
Subject: [Buildroot] [PATCH v2] linux: add shorter shortcuts
In-Reply-To: <1290075883-30494-1-git-send-email-vapier@gentoo.org>
References: <1290075883-30494-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290079906-3643-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only have one Linux kernel package, and "linux26-" is an anachronism
in today's world.  So add useful "linux-%" shortcuts to the "linux26-%".

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- update files in docs/ too

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
index 0a0114a..06ab8ed 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -432,7 +432,7 @@
 
     <p>The Linux kernel configuration can be customized just like
     <a href="#custom_busybox">BusyBox</a> and
-    <a href="#custom_uclibc">uClibc</a> using <code>make linux26-menuconfig
+    <a href="#custom_uclibc">uClibc</a> using <code>make linux-menuconfig
     </code>. Make sure you have enabled the kernel build in <code>make
     menuconfig</code> first. Once done, run <code>make</code> to (re)build
     everything.</p>
diff --git a/linux/linux.mk b/linux/linux.mk
index fb858b0..4ab519b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -188,3 +188,6 @@ endif
 endif
 
 endif
+
+linux-%:
+	$(MAKE) $(subst linux-,linux26-,$@)
-- 
1.7.3.2
