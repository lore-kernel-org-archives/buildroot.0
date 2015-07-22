From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 22 Jul 2015 16:06:40 -0500
Subject: [Buildroot] [PATCH 1/1] audit: disable python3 support
Message-ID: <1437599200-21453-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the version bump to 2.4.3, python3 support was added for
libaudit. With host machines that have python3 installed, this will
cause build issues such as:

  make[5]: Entering directory `/tmp/ryan/buildroot/output/build/audit-2.4.3/bindings/swig/python3'
  swig -o audit_wrap.c -python -py3 -modern -I. -I../../.. -I../../../lib -I/usr/include/python3.4m -I/usr/include/python3.4m ./../src/auditswig.i
  make[5]: swig: Command not found

Solution is to disable python3 support such as we do with python2.7.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/audit/audit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index ab3e087..99fc0c2 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -14,7 +14,7 @@ AUDIT_INSTALL_STAGING = YES
 # Patching configure.ac and Makefile.am
 AUDIT_AUTORECONF = YES
 
-AUDIT_CONF_OPTS = --without-python --disable-zos-remote
+AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 AUDIT_DEPENDENCIES += libcap-ng
-- 
1.9.1
