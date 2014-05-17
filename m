From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 19:34:50 +0200
Subject: [Buildroot] [PATCH] package/duma: do not let MAkefile guess OS
Message-ID: <1400348090-29954-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We ened to tell the duma Makefile what OS we're gonna run on, or it
uses default values.

It turns out the default values are the same as for OS=linux (and so
this change should be a no-op), but it's just better to force it, and
it avoids a warning during the build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/duma/duma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index d11987f..6e730f9 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -19,6 +19,7 @@ DUMA_OPTIONS = \
 # build time, is not specified in the Makefile. Force non-parallel build.
 define DUMA_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
+		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
 		$(DUMA_CPP) -C $(@D)
 endef
-- 
1.8.3.2
