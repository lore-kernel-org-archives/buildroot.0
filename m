From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 21:40:30 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: fix build with NLS
Message-ID: <20191014193429.F09A78DEBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8a032b678581e6912ccb3782aa74908a99a914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/43b5580fa9f26eac71afa9f3cca413f2791c054d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 9114b152eb..6cd5a019c5 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -9,7 +9,8 @@ POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/downlo
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
-POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
+POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
