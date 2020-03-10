From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Mar 2020 21:13:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix build without C++
Message-ID: <20200310201305.110543-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 02bd5eb59ff113203ea60ffee68bfdbacc4c9245 wrongly removed
avahi_cv_sys_cxx_works=yes as a result, build fails without C++

Fixes:
 - http://autobuild.buildroot.org/results/3d3596ad386144609549693c0a1aa9b704ba748c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.25.1
