From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:52 +0200
Subject: [Buildroot] [PATCH 5/7] package/frotz: use gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/frotz/frotz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index cc0421358c..c1362b2ac6 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -6,7 +6,7 @@
 
 FROTZ_VERSION = 2.53
 FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
-FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
+FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
 FROTZ_DEPENDENCIES = host-pkgconf ncurses
 FROTZ_LICENSE = GPL-2.0+
 FROTZ_LICENSE_FILES = COPYING
-- 
2.30.2
