From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 13:59:35 +0100
Subject: [Buildroot] [PATCH 2/5 v2] package infra: do not check hashes when
	downloading from a repository
In-Reply-To: <cover.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <39f9a41523a7e1f35e423bdabb722633f7dde494.1426597114.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When downloading from a repository, we have no way to ensure the
reproducibility of the generated archives, so we can't check the hashes.

Do not specifiy a hash file in those cases.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5e74519..e274712 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -87,7 +87,6 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -109,7 +108,6 @@ endef
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -128,7 +126,6 @@ endef
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
@@ -149,7 +146,6 @@ endef
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -189,7 +185,6 @@ endef
 define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
-- 
1.9.1
