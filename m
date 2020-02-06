From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Feb 2020 20:42:02 +0100
Subject: [Buildroot] [git commit] boot/optee-os: license files hashes only
 valid for latest version
Message-ID: <20200206193221.CA9D38D426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3091d334e740364e8a213d206896818e9b15255b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can only know the details of the license files for known versions.  For
custom, older or newer versions, the license files may change, or may be
moved around.

So, do for optee-os as was done for other packages in the recent past,
and only define the list of license files for the latest version.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/optee-os/optee-os.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index bedde85212..acdb25b479 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -6,7 +6,9 @@
 
 OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
 OPTEE_OS_LICENSE = BSD-2-Clause
+ifeq ($(BR2_TARGET_OPTEE_OS_LATEST),y)
 OPTEE_OS_LICENSE_FILES = LICENSE
+endif
 
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
