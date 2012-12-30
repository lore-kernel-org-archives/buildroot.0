From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:51 +0100
Subject: [Buildroot] [PATCH 13/19] efl/libevas: remove examples source code
	from target filesystem
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fee5783d17b7e69132d63ba4fb1b660ec2c862e3.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 098afe3..0a90842 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -203,5 +203,13 @@ else
 LIBEVAS_CONF_OPT += --disable-font-loader-eet
 endif
 
+# libevas installs the source code of examples on the target, which
+# are generally not useful.
+define LIBEVAS_REMOVE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/share/evas/examples/
+endef
+
+LIBEVAS_POST_INSTALL_TARGET_HOOKS += LIBEVAS_REMOVE_EXAMPLES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
