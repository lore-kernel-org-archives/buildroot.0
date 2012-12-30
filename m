From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:58 +0100
Subject: [Buildroot] [git commit] efl/libevas: remove examples source code
	from target filesystem
Message-ID: <20121230112957.6987E9A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fee5783d17b7e69132d63ba4fb1b660ec2c862e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
