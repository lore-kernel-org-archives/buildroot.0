From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:05:08 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <20160614150412.GF3060@hermes.click-hack.org>
References: <20160614150412.GF3060@hermes.click-hack.org>
Message-ID: <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove html and txt documentation from the rootfs as they unlikely to be
needed.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/wireshark/wireshark.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c7bf6c2..23996a3 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -99,4 +99,10 @@ else
 WIRESHARK_CONF_OPTS += --with-sbc=no
 endif
 
+define WIRESHARK_REMOVE_DOCS
+	find $(TARGET_DIR)/usr/share/wireshark -\( -name '*.txt' -o -name '*.html' -\) -delete
+endef
+
+WIRESHARK_POST_INSTALL_TARGET_HOOKS += WIRESHARK_REMOVE_DOCS
+
 $(eval $(autotools-package))
-- 
2.8.2
