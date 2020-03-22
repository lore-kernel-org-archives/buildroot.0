From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:13:54 +0100
Subject: [Buildroot] [git commit] package/avahi: fix build without C++
Message-ID: <20200322210046.C569584F10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47eba7135492b84b08b9c7e36be047bcb8f51763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 02bd5eb59ff113203ea60ffee68bfdbacc4c9245 wrongly removed
avahi_cv_sys_cxx_works=yes as a result, build fails without C++

Fixes:
 - http://autobuild.buildroot.org/results/3d3596ad386144609549693c0a1aa9b704ba748c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/avahi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 39289bd636..73db37545f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,7 +10,9 @@ AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
 
-AVAHI_CONF_ENV = DATADIRNAME=share
+AVAHI_CONF_ENV = \
+	avahi_cv_sys_cxx_works=yes \
+	DATADIRNAME=share
 
 # Note: even if we have Gtk2 and Gtk3 support in Buildroot, we
 # explicitly disable support for them, in order to avoid the following
