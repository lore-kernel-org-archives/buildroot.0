From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:46:14 +0200
Subject: [Buildroot] [PATCH 49/50 v2] package/busybox: add dependency on attr
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <5b94111a961b4f18589aa5b5dbc71fc71289e448.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

attr and busybox may each install setfattr, so attr must be installed
before busybox.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0a9af9f17b..5266f844b6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_ATTR),attr) \
 	$(if $(BR2_PACKAGE_BASH),bash) \
 	$(if $(BR2_PACKAGE_BC),bc) \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
-- 
2.14.1
