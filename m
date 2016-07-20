From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 23:43:34 +0200
Subject: [Buildroot] [git commit] package/elementary: add path to eolian_cxx
Message-ID: <20160720214337.9270F80238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df60d486c630ada7c6a7af63ade8767e6a7985b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When efl package is build with Eolian support, eolian_cxx tool is
build for the host.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elementary/elementary.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 33d4034..a06809f 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -33,5 +33,11 @@ HOST_ELEMENTARY_CONF_OPTS = \
 	--with-doxygen=no \
 	--disable-elementary-test
 
+# Use Eolian C++ parser only if enabled in the efl stack.
+ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
+ELEMENTARY_CONF_OPTS += --with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
+HOST_ELEMENTARY_CONF_OPTS += --with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
