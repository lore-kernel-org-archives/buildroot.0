From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 11:36:25 +0100
Subject: [Buildroot] [git commit] host-qemu: needs host-python
Message-ID: <20150206123124.6FAC781787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fe41593a97bc9d7baaed790aa91bbc7916d3a99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e58/e58a0d7d5c084be000ae7d5b3821cd68d6639aab/
http://autobuild.buildroot.net/results/624/62425cfdd4270bf1a9b15bd57490478b1c04c720/
http://autobuild.buildroot.net/results/d18/d189d7f75ffbb3349b68a5c312b14ea5638bb903/
http://autobuild.buildroot.net/results/7d3/7d386322cec452ee636adb20be0c1a31f38385fc/

And many more.

Just like qemu for the target, host-qemu needs python (2.x) on the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6c5ddf3..259813c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -16,7 +16,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -94,6 +94,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--interp-prefix=$(STAGING_DIR)          \
 		--cc="$(HOSTCC)"                        \
 		--host-cc="$(HOSTCC)"                   \
+		--python=$(HOST_DIR)/usr/bin/python2    \
 		--extra-cflags="$(HOST_CFLAGS)"         \
 		--extra-ldflags="$(HOST_LDFLAGS)"
 endef
