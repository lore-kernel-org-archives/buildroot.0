From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 08:17:13 +0100
Subject: [Buildroot] [git commit] ndisc6: use LIBS for libintl
Message-ID: <20141119095019.D2B71B4ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ea07d5286c00ac286615d4bc340c531fbfc5ebd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use LIBS instead of LDFLAGS for "-lintl", otherwise LDFLAGS gets
evaluated to the left of object files and fails to link statically
because of incorrect symbol resolution order. Fixes:
http://autobuild.buildroot.net/results/21b/21bf88c9dbaecc204598e60dd9c7392a85068dd6/

Also rename patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x.patch => 0001-trace-tcp-upd-uClibc-fix.patch} |    0
 package/ndisc6/ndisc6.mk                           |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch b/package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch
similarity index 100%
rename from package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch
rename to package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index b0e4caf..cd43b01 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -14,7 +14,7 @@ NDISC6_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 NDISC6_DEPENDENCIES += gettext
-NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
+NDISC6_CONF_ENV += LIBS="-lintl"
 endif
 
 NDISC6_BIN_ += dnssort # perl script
