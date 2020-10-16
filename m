From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Oct 2020 08:43:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: link with libatomic if
 needed
Message-ID: <20201016064320.1980661-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of kismet-2020-09-R3 with riscv64

Fixes:
 - http://autobuild.buildroot.org/results/9c3d56ef837c7c5bfbb34a0ec51b349108e201b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/kismet.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 853dabf106..54d014021f 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -27,6 +27,10 @@ endif
 
 KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+KISMET_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
 KISMET_CONF_OPTS += --enable-libcap
-- 
2.28.0
