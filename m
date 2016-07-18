From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 18 Jul 2016 22:51:27 +0200
Subject: [Buildroot] [PATCHv2 2/2] package/elementary: add path to eolian_cxx
In-Reply-To: <1468875087-17192-1-git-send-email-romain.naour@gmail.com>
References: <1468875087-17192-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1468875087-17192-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When efl package is build with Eolian support, eolian_cxx tool is
build for the host.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: set eolian_cxx path only if Eolian C++ bindings are enabled
    in the efl stack.
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
-- 
2.5.5
