From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 20:01:46 +0200
Subject: [Buildroot] [git commit] pkg-download: Fix DOWNLOAD_LOCALFILES
Message-ID: <20140718180154.D7B839D27D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=402a537b3550b422d85b74a86e78a63d22537836
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cp helperscript expects a filename as target, but just the folder
name was given.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7f208d5..118591c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -206,7 +206,7 @@ endef
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
-					 $(DL_DIR) && \
+					 $(DL_DIR)/$(2) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
