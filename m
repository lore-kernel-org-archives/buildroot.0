From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Jan 2013 00:45:28 +0100
Subject: [Buildroot] [PATCH] libelementary: depends on libethumb
Message-ID: <1357947928-10549-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

This was exposed because I still had an old libethumb in my staging
directory so it was detected by configure, but because of the missing
dependency it was still the (incompatible) version from before the
1.7.4 bump.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/libelementary/libelementary.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 81289ff..f63f0dc 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -18,4 +18,11 @@ LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
 LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
 
+ifeq ($(BR2_PACKAGE_LIBETHUMB),y)
+LIBELEMENTARY_DEPENDENCIES += libethumb
+LIBELEMENTARY_CONF_OPT += --enable-ethumb
+else
+LIBELEMENTARY_CONF_OPT += --disable-ethumb
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
