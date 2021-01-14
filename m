From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:34:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-pam: drop useless
 LINUX_PAM_CPE_ID_NAME definition
In-Reply-To: <20210114223432.456542-1-thomas.petazzoni@bootlin.com>
References: <20210114223432.456542-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210114223432.456542-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This definition is useless, because it is equal to the default value
of <pkg>_CPE_ID_NAME as calculated by generic-package.

Before and after this patch, the CPE ID calculated for the linux-pam
package is exactly the same, according to "make linux-pam-show-info".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-pam/linux-pam.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index be4d11bb10..9c0815db24 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -22,7 +22,6 @@ LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
-LINUX_PAM_CPE_ID_NAME = linux-pam
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
-- 
2.29.2
