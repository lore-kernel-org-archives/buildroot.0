From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:44 +0200
Subject: [Buildroot] [PATCH 064/100] popt: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-65-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
-- 
2.9.4
