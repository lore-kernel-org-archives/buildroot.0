From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Feb 2020 15:48:43 +0100
Subject: [Buildroot] [PATCH 6/6 v2] boot/optee-os: license files hashes only
 valid for latest version
In-Reply-To: <cover.1580914115.git.yann.morin.1998@free.fr>
References: <cover.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <76db34fbca7b956090aaf4557510cf89a3d2d72c.1580914115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can only know the path to the license files for the known version.
For custom, older or newer, versions may change, or may be moved
around.

So, do for optee-os as was done for other packages in the recent past,
and only define the list of license files for the latest version.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
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
-- 
2.20.1
