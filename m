From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:07 +0200
Subject: [Buildroot] [PATCH 087/100] gptfdisk: remove libintl static linking
	handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-88-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
special code that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/gptfdisk.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 9c94421..c5826df 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -22,13 +22,8 @@ GPTFDISK_DEPENDENCIES += ncurses
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-# gptfdisk dependencies may link against libintl/libiconv, so we need
-# to do so as well when linking statically
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-GPTFDISK_DEPENDENCIES += gettext
-GPTFDISK_LDLIBS += -lintl
-endif
-
+# gptfdisk dependencies may link against libiconv, so we need to do so
+# as well when linking statically
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GPTFDISK_DEPENDENCIES += libiconv
 GPTFDISK_LDLIBS += -liconv
-- 
2.9.4
