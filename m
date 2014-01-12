From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 00:44:47 +0100
Subject: [Buildroot] [PATCH 4/6] package infra: DOWNLOAD is never called
	with two arguments
In-Reply-To: <cover.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <894fddeb65b5990ef4926605cfe58f1d19804ec8.1389569992.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the DOWNLOAD helper accepts one or two arguments:
  - the source URI
  - the source filename, if missing, derived from the URI

But we have no caller of DOWNLOAD that passes a second argument.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 8e6f7a3..f3354d1 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -227,14 +227,13 @@ endef
 # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
-# Argument 2 is the source filename
 #
 # E.G. use like this:
-# $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
+# $(call DOWNLOAD,$(FOO_SITE))
 ################################################################################
 
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
+	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
 endef
 
 define DOWNLOAD_INNER
-- 
1.8.1.2
