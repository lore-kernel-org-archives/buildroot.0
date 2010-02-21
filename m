From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:05 +0100
Subject: [Buildroot] [PATCH 27/38] iw: give path to pkg-config
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aa63fef21d4a31b49729a3bf5c8ae859170df214.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
