From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 May 2018 09:02:21 +0200
Subject: [Buildroot] [git commit] libcap: only install shared version
Message-ID: <20180513193732.D4C2F8C899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7984f2d97b4271c14e0922ef22027edaedd78e59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_SHARED_LIBS is set, only install shared version of library
(continue to build both libraries through all target as there is no
libcap.so target but only a libcap.so.$(VERSION).$(MINOR))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap/libcap.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 48c2cb3456..a947fa0686 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -18,6 +18,9 @@ HOST_LIBCAP_DEPENDENCIES = host-gperf
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBCAP_MAKE_TARGET = libcap.a libcap.pc
 LIBCAP_MAKE_INSTALL_TARGET = install-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBCAP_MAKE_TARGET = all
+LIBCAP_MAKE_INSTALL_TARGET = install-shared
 else
 LIBCAP_MAKE_TARGET = all
 LIBCAP_MAKE_INSTALL_TARGET = install
