From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jan 2021 08:03:04 +0100
Subject: [Buildroot] [git commit] package/linux-pam: drop useless
 LINUX_PAM_CPE_ID_NAME definition
Message-ID: <20210115064433.0278B827F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30bd7262e5f0a1dd35b4efbcd1619e892e4afa44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This definition is useless, because it is equal to the default value
of <pkg>_CPE_ID_NAME as calculated by generic-package.

Before and after this patch, the CPE ID calculated for the linux-pam
package is exactly the same, according to "make linux-pam-show-info".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
