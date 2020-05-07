From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 22:47:16 +0200
Subject: [Buildroot] [git commit] package/apparmor: skip docs building
Message-ID: <20200507203150.D306690EFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=047832a1f2f4a00a314b16289e73757f7978b2f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When pod2man and pod2html are missing, building now exits with an
error.
Building of man pages and documentation should be skipped in buildroot,
setting both executables to the "true" command it's sufficient to skip
them.

Fixes:
http://autobuild.buildroot.net/results/ca8d3071d888b5c1cfa3e275afaf05415e19627f

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index f1b765ce42..f667966082 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -15,7 +15,7 @@ APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
 APPARMOR_DEPENDENCIES = libapparmor
 
 APPARMOR_TOOLS = parser
-APPARMOR_MAKE_OPTS = USE_SYSTEM=1 DISTRO=unknown
+APPARMOR_MAKE_OPTS = USE_SYSTEM=1 DISTRO=unknown POD2MAN=true POD2HTML=true
 
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 APPARMOR_DEPENDENCIES += gettext
