From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:24 +0200
Subject: [Buildroot] [PATCH 12/22] package: remove unused STRIP_DISCARD_ALL
	variable
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bf6cacd9f139551d534b041f80547e69199ae2be.1334673910.git.thomas.petazzoni@free-electrons.com>
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
index 943017b..7c75406 100644
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
