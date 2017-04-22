From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:49:18 +0200
Subject: [Buildroot] [PATCH v9 6/7] e2fsprogs: only add -lintl for static
	builds
In-Reply-To: <20170422224919.3257-1-arnout@mind.be>
References: <20170422224919.3257-1-arnout@mind.be>
Message-ID: <20170422224919.3257-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

For dynamic library builds, it's not needed to pass it explicitly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v9: remove addition of empty lines
---
 package/e2fsprogs/e2fsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index a60c69b395..70a1e4eab5 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -77,7 +77,7 @@ HOST_E2FSPROGS_CONF_ENV += \
 	ac_cv_header_magic_h=no \
 	ac_cv_lib_magic_magic_file=no
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
 # util-linux libuuid pulls in libintl if needed, so ensure we also
 # link against it, otherwise static linking fails
 E2FSPROGS_CONF_ENV += LIBS=-lintl
-- 
2.11.0
