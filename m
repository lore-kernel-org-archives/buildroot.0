From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 10:55:55 +0100
Subject: [Buildroot] [git commit] policycoreutils: restorecon libglib2
	dependency
Message-ID: <20161213095601.BE1DE7FCF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08af46e39081bea4cf73ac8bd2031b3996e31b90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated to match Config.in select of libglib2
package as dependency if restorecon is enabled.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/policycoreutils/policycoreutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index c9f9ebc..86639cc 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -48,6 +48,7 @@ POLICYCOREUTILS_MAKE_DIRS = \
 
 ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
 POLICYCOREUTILS_MAKE_DIRS += restorecond
+POLICYCOREUTILS_DEPENDENCIES += libglib2
 endif
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.
