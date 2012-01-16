From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 16 Jan 2012 16:04:36 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1326726276-8442-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in      |    1 +
 package/kmod/Config.in |    7 +++++++
 package/kmod/kmod.mk   |    8 ++++++++
 3 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/kmod/Config.in
 create mode 100644 package/kmod/kmod.mk

diff --git a/package/Config.in b/package/Config.in
index 1042d95..2d0550f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -557,6 +557,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
 source "package/htop/Config.in"
+source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
diff --git a/package/kmod/Config.in b/package/kmod/Config.in
new file mode 100644
index 0000000..f83237e
--- /dev/null
+++ b/package/kmod/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KMOD
+	bool "kmod"
+	help
+	  handle kernel modules
+
+	  http://git.profusion.mobi/cgit.cgi/kmod.git/
+
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
new file mode 100644
index 0000000..1d21296
--- /dev/null
+++ b/package/kmod/kmod.mk
@@ -0,0 +1,8 @@
+KMOD_VERSION = 3
+KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.bz2
+KMOD_SITE = http://git.profusion.mobi/cgit.cgi/kmod.git/snapshot
+KMOD_INSTALL_STAGING =YES
+KMOD_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.1.1
