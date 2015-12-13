From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 16:01:20 +0100
Subject: [Buildroot] [git commit] package/gawk: add optional readline
	dependency
Message-ID: <20151213150128.DCE7480412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f7ee942c6e4c0eb1aa2bc3ed487d8fcb1ce0085
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gawk debugger can optionally use readline for user input during
the debugging session (for the usual autocompletion and stuff).

Enable readline support when the readline package is enabled; let
./configure automatically find it. Forcibly disable readline support
when the readline package is disabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 0fd131d..507ea6d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -24,6 +24,14 @@ else
 GAWK_CONF_OPTS += --without-mpfr
 endif
 
+# --with-readline requires an argument so just let
+# configure find it automatically
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GAWK_DEPENDENCIES += readline
+else
+GAWK_CONF_OPTS += --without-readline
+endif
+
 # We don't have a host-busybox, and we don't want to use readline or mpfr
 HOST_GAWK_DEPENDENCIES =
 
