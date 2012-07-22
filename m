From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:24 +0200
Subject: [Buildroot] [git commit] pkg-download.mk: use stripurischeme
	function in localfiles download method
Message-ID: <20120722151730.35E9890E62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d57669271d079b3bf09c5ae81f42871260d60c49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fb51540..ca5b404 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -178,11 +178,11 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-		$(LOCALFILES) $(call qstrip,$(subst file://,,$(1))) $(DL_DIR)
+		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)
 endef
 
 define SOURCE_CHECK_LOCALFILES
-  test -e $(call qstrip,$(subst file://,,$(1)))
+  test -e $(call stripurischeme,$(call qstrip,$(1)))
 endef
 
 define SHOW_EXTERNAL_DEPS_LOCALFILES
