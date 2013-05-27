From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 May 2013 12:36:43 +0200
Subject: [Buildroot] [PATCH 3/4] busybox: ensure $(BUSYBOX_BUILD_CONFIG) is
	writable
In-Reply-To: <cover.1369650924.git.yann.morin.1998@free.fr>
References: <cover.1369650924.git.yann.morin.1998@free.fr>
Message-ID: <12f893c8c318d2068e46ddfd1e1e0270f8839b1a.1369650924.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Lynch <ntl@pobox.com>

If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 985203c..0b6c18f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -123,7 +123,7 @@ endef
 endif
 
 define BUSYBOX_COPY_CONFIG
-	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
+	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
 
 # Disable shadow passwords support if unsupported by the C library
-- 
1.8.1.2
