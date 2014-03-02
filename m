From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 21:01:40 +0100
Subject: [Buildroot] [git commit] pkg-infra: DOWNLOAD is never called with
	two arguments
Message-ID: <20140302200146.6BC6E9B9D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18edb40bf539bed08d0d2f84bc5c547e4a22e656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the DOWNLOAD helper accepts one or two arguments:
  - the source URI
  - the source filename; if missing, it is derived from the URI

But we have no caller of DOWNLOAD that passes a second argument.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
