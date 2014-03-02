From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:34 +0100
Subject: [Buildroot] [PATCH 01/13] pkg-infra: DOWNLOAD is never called with
	two arguments
In-Reply-To: <cover.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <9eef3379eac2949fdf344b49b605a30aef49340c.1393781649.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the DOWNLOAD helper accepts one or two arguments:
  - the source URI
  - the source filename; if missing, it is derived from the URI

But we have no caller of DOWNLOAD that passes a second argument.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 6d4cbcd..85842de 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -238,14 +238,13 @@ endef
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
1.8.3.2
