From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:09:04 +0100
Subject: [Buildroot] [PATCH 16/19] package: fix unstripped binary
	installation
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-17-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e643577..bc0ac7c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,7 +163,7 @@ TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 STRIPCMD=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP=true Not_stripping
+TARGET_STRIP=true
 STRIPCMD=$(TARGET_STRIP)
 endif
 INSTALL:=$(shell which install || type -p install)
-- 
1.6.6
