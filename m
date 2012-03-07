From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:34:25 +0100
Subject: [Buildroot] [PATCH 12/13] package: remove unused STRIP_DISCARD_ALL
	variable
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4dd84de28f2f8192657da91d5c07c23330aa52f1.1331148806.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4f72864..29ba497 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -126,7 +126,6 @@ TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
 ifeq ($(BR2_STRIP_strip),y)
-STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
 STRIP_STRIP_ALL:=--strip-all
 TARGET_STRIP=$(TARGET_CROSS)strip
@@ -134,7 +133,6 @@ STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
-STRIP_DISCARD_ALL:=
 STRIP_STRIP_UNNEEDED:=
 STRIP_STRIP_ALL:=
 TARGET_STRIP=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
-- 
1.7.4.1
