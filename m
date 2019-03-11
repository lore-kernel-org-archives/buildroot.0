From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Mar 2019 22:22:17 +0100
Subject: [Buildroot] [git commit] package/wireshark: add optional spandsp
 dependency
Message-ID: <20190311211927.0CAC38E8E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee772dad7b76dcc49bc86b5a232ccdcedec60904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 5f04af1f29..a917efb5f6 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -145,6 +145,13 @@ else
 WIRESHARK_CONF_OPTS += --without-snappy
 endif
 
+ifeq ($(BR2_PACKAGE_SPANDSP),y)
+WIRESHARK_CONF_OPTS += --with-spandsp
+WIRESHARK_DEPENDENCIES += spandsp
+else
+WIRESHARK_CONF_OPTS += --without-spandsp
+endif
+
 define WIRESHARK_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
 		-o -name '*.html' -print0 | xargs -0 rm -f
