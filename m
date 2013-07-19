From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 14:13:43 +0200
Subject: [Buildroot] [PATCH] trivial: use geturischeme helper function where
	possible
Message-ID: <1b6f296fec701a154c75.1374236023@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-download.mk contains some helper functions to obtain subparts of URLs,
like the URI scheme. In pkg-generic.mk, there is still one opportunity to use
that helper function, instead of hardcoding it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -269,7 +269,7 @@ ifndef $(2)_SITE_METHOD
   $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
  else
 	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
+	$(2)_SITE_METHOD = $(call geturischeme,$($(2)_SITE))
  endif
 endif
 
