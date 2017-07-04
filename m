From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:34:03 +0200
Subject: [Buildroot] [git commit] popt: use the new gettext logic
Message-ID: <20170704233518.5CBC47F87D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d24b8afb22c92bc8042f07d7e5073fb2f6f30dc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/popt.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 3ab5388..99c5138 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -11,10 +11,7 @@ POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
 POPT_AUTORECONF = YES
 POPT_GETTEXTIZE = YES
-
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-POPT_DEPENDENCIES += gettext
-endif
+POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
