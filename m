From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 08:04:34 +0100
Subject: [Buildroot] [git commit] libjpeg: fix "jpegtran" spelling in
	target-install hook
Message-ID: <20140211082557.BBFC29C96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e27be34c304588e86be8fd6aec726682c17bbe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use correct bin name so that LIBJPEG_REMOVE_USELESS_TOOLS fixup
actually removes it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b0b02ad..a5898a4 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -10,7 +10,7 @@ LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_INSTALL_STAGING = YES
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom wrjpgcom)
 endef
 
 LIBJPEG_POST_INSTALL_TARGET_HOOKS += LIBJPEG_REMOVE_USELESS_TOOLS
