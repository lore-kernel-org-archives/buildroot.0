From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:25:54 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/util-linux: Add
 autoreconf for wipefs
Message-ID: <20200307202445.ED45C8FBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45979b950f37558f148804757283a36382248bb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Patch for adding the `--enable-wipefs` configuration option requires an
reconfiguration of autotools which is causing autobuilder failures.

Signed-off-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c4059e9f8f7043cf58075b5401f5391ff8475d82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0ed8a22fc1..7bd7a89e18 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -23,6 +23,7 @@ UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
+UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
 
 # system depends on util-linux so we enable systemd support
