From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:51:54 +0200
Subject: [Buildroot] [PATCH 02/20] Add dependency from util-linux on ncurses
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e0f441a234dc2e0e8b49272ab608da2e7c69f2a7.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

util-linux can build without ncurses, but when ncurses is available,
additional features can be built (such as the more
command). Therefore, in util-linux.mk, when ncurses is available, mark
it as a dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f330447..445b4d1 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -23,6 +23,10 @@ UTIL-LINUX_DEPENDENCIES += gettext libintl
 UTIL-LINUX_MAKE_OPT = LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+UTIL-LINUX_DEPENDENCIES += ncurses
+endif
+
 $(DL_DIR)/$(UTIL-LINUX_SOURCE):
 	$(call DOWNLOAD,$(UTIL-LINUX_SITE),$(UTIL-LINUX_SOURCE))
 
-- 
1.7.0.4
