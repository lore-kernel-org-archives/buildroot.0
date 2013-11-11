From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 18:45:17 +0100
Subject: [Buildroot] [PATCH 2/2] busybox: ensure $(BUSYBOX_BUILD_CONFIG) is
	writable
In-Reply-To: <cover.1384191560.git.yann.morin.1998@free.fr>
References: <cover.1384191560.git.yann.morin.1998@free.fr>
Message-ID: <0b4acecdd3e9fb7d9510c206338ebbdfa483ca9e.1384191560.git.yann.morin.1998@free.fr>
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
index ad8bdaf..8d40bca 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -135,7 +135,7 @@ endef
 endif
 
 define BUSYBOX_COPY_CONFIG
-	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
+	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
 
 # Disable shadow passwords support if unsupported by the C library
-- 
1.8.1.2
