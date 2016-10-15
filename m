From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:24 +0200
Subject: [Buildroot] [git commit] iw: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121835.E8A4B81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce3e7a33cb6244a46879487d42883cca56ce5397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 6f3f309..925a770 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -11,7 +11,9 @@ IW_LICENSE = ISC
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
-IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
+IW_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 define IW_BUILD_CMDS
