From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 00:28:29 +0100
Subject: [Buildroot] [PATCH] linux-pam: add missing dependency on host-flex
Message-ID: <1364167709-8034-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/d8c52c0563e912e03c5f006f5865aa58f70d10e1/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/linux-pam.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index be51049..f5388c1 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -16,7 +16,8 @@ LINUX_PAM_CONF_OPT = \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) flex
+LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	flex host-flex
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
-- 
1.7.9.5
