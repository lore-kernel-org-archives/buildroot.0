From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 11:29:09 +0100
Subject: [Buildroot] [git commit] package/kismet: do not use host headers
Message-ID: <20141227102918.B5AF17FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5aea55e0ee15ccab1021700c56bd17cbfd3f45a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kismet's ./configure hard-codes host paths in its include search paths.
Fix that by removing the offending paths.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/0004-no-include-host-paths.patch |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/kismet/0004-no-include-host-paths.patch b/package/kismet/0004-no-include-host-paths.patch
new file mode 100644
index 0000000..1dcf120
--- /dev/null
+++ b/package/kismet/0004-no-include-host-paths.patch
@@ -0,0 +1,23 @@
+configure: do not hard-code host paths
+
+configure hard-codes include dirs to contain /usr/include/ncurses.
+Needless to say this does not work well for cross-compilation.
+
+Remove that directory from the include search dirs.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
+--- kismet-Kismet-2014-02-R1.orig/configure.in	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/configure.in	2014-12-26 16:46:55.770692349 +0100
+@@ -406,9 +406,6 @@
+ )
+ AC_SUBST(wantclient)
+ 
+-# Add additional cflags since some distros bury panel.h
+-CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
+-
+ termcontrol="none";
+ 
+ if test "$wantclient" = "yes"; then
