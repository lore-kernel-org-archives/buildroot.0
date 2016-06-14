From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 22:33:37 +0200
Subject: [Buildroot] [git commit] wireshark: remove documentation
Message-ID: <20160614205214.639AE7FF5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fee4f51ac6bc7c99b2ded8444f03ff42d885679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove html and txt documentation from the rootfs as they unlikely to be
needed.

[Peter: use xargs instead of GNU extensions as suggested by Yann]
Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 59670f9..55f931b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -99,4 +99,11 @@ else
 WIRESHARK_CONF_OPTS += --with-sbc=no
 endif
 
+define WIRESHARK_REMOVE_DOCS
+	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
+		-o -name '*.html' -print0 | xargs -0 rm -f
+endef
+
+WIRESHARK_POST_INSTALL_TARGET_HOOKS += WIRESHARK_REMOVE_DOCS
+
 $(eval $(autotools-package))
