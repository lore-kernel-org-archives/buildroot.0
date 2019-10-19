From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:22:11 +0200
Subject: [Buildroot] [git commit] package/util-linux: Add autoreconf for
 wipefs
Message-ID: <20191019221958.23C8682B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4059e9f8f7043cf58075b5401f5391ff8475d82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch for adding the `--enable-wipefs` configuration option requires an
reconfiguration of autotools which is causing autobuilder failures.

Signed-off-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0374420b58..534cff2492 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -23,6 +23,7 @@ UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
+UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
 
 # system depends on util-linux so we enable systemd support
