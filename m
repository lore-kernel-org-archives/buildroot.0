From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] iw: give path to pkg-config
Message-ID: <20100223202932.7EA3D776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5ffabd4c33c7d2a37ca8c7b98601a19286bfe12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At install stage, iw needs pkg-config, through the PKG_CONFIG
environment variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2dd1cd4..89fd604 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -11,6 +11,7 @@ IW_DEPENDENCIES = libnl
 IW_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 $(eval $(call AUTOTARGETS,package,iw))
-- 
1.6.3.3
