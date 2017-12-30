From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 13:22:15 +0100
Subject: [Buildroot] [git commit] package/brltty: add missing dependency on
 host-pkgconf
Message-ID: <20171230122227.9C187835B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6d4deb64f9be477c0020e5083ab4b6110c80fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following error:
  ./configure: line 14978: .../host/bin/pkg-config: No such file or directory

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/brltty/brltty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 632aa68..eb91ef8 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -11,7 +11,7 @@ BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
 
-BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf
+BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf
 
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
