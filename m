From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 20:58:33 +0100
Subject: [Buildroot] [git commit] libelementary: depends on libethumb
Message-ID: <20130112200214.171129983C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=051058f52ae701928829b2304df4507892b44cfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was exposed because I still had an old libethumb in my staging
directory so it was detected by configure, but because of the missing
dependency it was still the (incompatible) version from before the
1.7.4 bump.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libelementary/libelementary.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
