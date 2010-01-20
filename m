From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 20 Jan 2010 01:32:12 +0100
Subject: [Buildroot] [PATCH] package: fix unstripped binary installation
In-Reply-To: <20100119193235.2681.75712.stgit@localhost.localdomain>
References: <20100119193235.2681.75712.stgit@localhost.localdomain>
Message-ID: <1263947532-10023-1-git-send-email-llandwerlin@gmail.com>
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
1.6.5.7
