From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:21:32 +0200
Subject: [Buildroot] [git commit] audit: disable python3 support
Message-ID: <20150722212206.F0EE781E6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a8951273a567a6bdf11f77ba40f99acf28d3bfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the version bump to 2.4.3, python3 support was added for
libaudit. With host machines that have python3 installed, this will
cause build issues such as:

  make[5]: Entering directory `/tmp/ryan/buildroot/output/build/audit-2.4.3/bindings/swig/python3'
  swig -o audit_wrap.c -python -py3 -modern -I. -I../../.. -I../../../lib -I/usr/include/python3.4m -I/usr/include/python3.4m ./../src/auditswig.i
  make[5]: swig: Command not found

Solution is to disable python3 support such as we do with python2.7.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 806bd97..61e876b 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -14,7 +14,7 @@ AUDIT_INSTALL_STAGING = YES
 # Patching Makefile.am
 AUDIT_AUTORECONF = YES
 
-AUDIT_CONF_OPTS = --without-python --disable-zos-remote
+AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 AUDIT_DEPENDENCIES += libcap-ng
