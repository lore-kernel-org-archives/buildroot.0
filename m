From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 09:10:33 +0100
Subject: [Buildroot] [git commit] taglib: depend on zlib if appropriate
Message-ID: <20131231081149.D9C079C2DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d13ec0afc16401551df6b7e26d28deb1b078b75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taglib/taglib.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 75e8e67..c04c88b 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -10,6 +10,10 @@ TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPLv2.1 MPL
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+TAGLIB_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
 TAGLIB_CONF_OPT += -DWITH_ASF=ON
 endif
