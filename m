From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:33 +0200
Subject: [Buildroot] [git commit] lesstif: remove host/usr reference from
	.mk comment
Message-ID: <20170705141336.6947F81D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90fe15612ca205c471e8d5b46c8eef89bd63e9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While we're at it, correct it to $(HOST_DIR).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lesstif/lesstif.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 35d2c6d..378c594 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -31,7 +31,7 @@ define LESSTIF_NOMAN2HTML
 endef
 
 # Prevents to copy ac_find_motif.m4 on target, it would else
-# be created at $(TARGET_DIR)/$(TOPDIR)/output/host/usr/share/aclocal/ac_find_motif.m4
+# be created at $(TARGET_DIR)/$(HOST_DIR)/share/aclocal/ac_find_motif.m4
 define LESSTIF_FIXACLOCAL
 	sed -i -e "/install-data-am: install-aclocalDATA/d" $(@D)/scripts/autoconf/Makefile
 endef
