From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:37:04 +0100
Subject: [Buildroot] [git commit] package/expedite: move to package directory
Message-ID: <20151212134520.67778802E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15d288520c10b7edf311e87b3ae45503957a66f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no advantage for efl related packages to share the same version
number anymore (except for Efl and Elementary).

Here are the version number used for the 1.15 stable release:
EFL                     1.15.2
Elementary              1.15.2
Emotion Generic Players 1.15.0
Evas Generic Loaders    1.15.0
Python-EFL              1.15.0

Also, we usually do not have a sub-directory for a family of related
packages which don't share the same version number, so move expedite
to the package directory. Expedite now appears in the
"Graphic libraries and applications (graphic/text)" in the Kconfig menu.

In a followup patch, expedite will be downloaded directly from the 1.15
branch in the git repository since there is no new tarball release after
1.7.0.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      | 1 +
 package/efl/Config.in                  | 1 -
 package/{efl => }/expedite/Config.in   | 1 +
 package/{efl => }/expedite/expedite.mk | 0
 4 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 0eb6fda..9610423 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3d31a26..cb91660 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -10,7 +10,6 @@ menuconfig BR2_PACKAGE_EFL
 
 if BR2_PACKAGE_EFL
 
-source "package/efl/expedite/Config.in"
 source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
diff --git a/package/efl/expedite/Config.in b/package/expedite/Config.in
similarity index 95%
rename from package/efl/expedite/Config.in
rename to package/expedite/Config.in
index 1e12108..de6a056 100644
--- a/package/efl/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EXPEDITE
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
+	depends on BR2_PACKAGE_EFL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	help
diff --git a/package/efl/expedite/expedite.mk b/package/expedite/expedite.mk
similarity index 100%
rename from package/efl/expedite/expedite.mk
rename to package/expedite/expedite.mk
