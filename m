From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Fri, 11 Oct 2019 14:40:39 +0200
Subject: [Buildroot] [PATCH v3 1/9] package/libev: use
 host-autotools-package macro
In-Reply-To: <20191011124131.28246-1-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
Message-ID: <20191011124131.28246-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Enable host support for the lib because the package host-sysrepo (depends on
package libnetconf2) is needed by package netopeer2keystored.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/libev/libev.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 2b2d5db004..38b0530f62 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -18,3 +18,4 @@ endef
 LIBEV_POST_PATCH_HOOKS += LIBEV_DISABLE_EVENT_H_INSTALL
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
