From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 May 2018 22:13:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/aufs: remove redundant ':' sign
In-Reply-To: <1525551191-7113-1-git-send-email-jerzy.m.grzegorek@gmail.com>
References: <1525551191-7113-1-git-send-email-jerzy.m.grzegorek@gmail.com>
Message-ID: <1525551191-7113-2-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/aufs/aufs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
index 55dbf94..6cd05d8 100644
--- a/package/aufs/aufs.mk
+++ b/package/aufs/aufs.mk
@@ -15,7 +15,7 @@ else ifeq ($(BR2_PACKAGE_AUFS_SERIES),4)
 AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
 endif
 
-ifeq ($(BR_BUILDING):$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),y:y:)
+ifeq ($(BR_BUILDING)$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),yy:)
 $(error No aufs version specified)
 endif
 
-- 
1.9.1
