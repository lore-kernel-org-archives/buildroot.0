From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:08 +0200
Subject: [Buildroot] [PATCH 12/34] reproducibility/wireshark: remove
	documentation
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-12-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HTML documentation contains a link to a mail address specific to
the distribution of the build machine. Remove html documentation
from the rootfs as it is unlikely to be needed. At this chance
also remove the txt documentation.
---
 package/wireshark/wireshark.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ffadf80..43adb1e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -28,4 +28,10 @@ WIRESHARK_CONF_OPTS = \
 	--with-libsmi=no \
 	--includedir=$(STAGING_DIR)/usr/include
 
+define WIRESHARK_REMOVE_DOCS
+	find $(TARGET_DIR)/usr/share/wireshark -\( -name '*.txt' -o -name '*.html' -\) -delete
+endef
+
+WIRESHARK_POST_INSTALL_TARGET_HOOKS += WIRESHARK_REMOVE_DOCS
+
 $(eval $(autotools-package))
-- 
2.7.4
