From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 20:15:15 +0200
Subject: [Buildroot] [git commit] build: cleanup remaining references to
	BR2_STRIP_sstrip
Message-ID: <20160610181612.0E21E80E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de2fff217402eb8e6321610cf700f4b0393caa02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sstrip option has been removed in commit
106f5b8c5093 ("build: remove deprecated sstrip option").

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                  | 8 --------
 support/dependencies/dependencies.mk | 4 ----
 2 files changed, 12 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2d454a6..f6d1e67 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -201,14 +201,6 @@ TARGET_STRIP = $(TARGET_CROSS)strip
 STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 KSTRIPCMD = $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
-ifeq ($(BR2_STRIP_sstrip),y)
-STRIP_STRIP_DEBUG :=
-STRIP_STRIP_UNNEEDED :=
-STRIP_STRIP_ALL :=
-TARGET_STRIP = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-STRIPCMD = $(TARGET_STRIP)
-KSTRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
-endif
 ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP = true
 STRIPCMD = $(TARGET_STRIP)
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 8232721..4334dac 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -16,10 +16,6 @@ $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
 -include $(sort $(wildcard support/dependencies/check-host-*.mk))
 
-ifeq ($(BR2_STRIP_sstrip),y)
-DEPENDENCIES_HOST_PREREQ += host-sstrip
-endif
-
 ifeq ($(BR2_CCACHE),y)
 DEPENDENCIES_HOST_PREREQ += host-ccache
 endif
