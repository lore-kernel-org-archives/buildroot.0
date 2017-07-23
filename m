From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:12:05 +0200
Subject: [Buildroot] [Patch v7 09/10] libcurl: add host variant
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081206.7774-10-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libcurl/libcurl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6848449..0e216ca 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -82,4 +82,7 @@ endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
+HOST_LIBCURL_DEPENDENCIES = host-openssl
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.4
