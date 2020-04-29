From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 29 Apr 2020 23:18:40 +0200
Subject: [Buildroot] [PATCH v2] package/apparmor: skip docs building
Message-ID: <20200429211840.215032-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When pod2man and pod2html are missing, building now exits with an
error.
Building of man pages and documentation should be skipped in buildroot,
setting both executables to the "true" command it's sufficient to skip
them.

Fixes:
http://autobuild.buildroot.net/results/ca8d3071d888b5c1cfa3e275afaf05415e19627f

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelog:
v1->v2:
 * "echo" to "true" (Thomas P.)

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
-- 
2.25.1
