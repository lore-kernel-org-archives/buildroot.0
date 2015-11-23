From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:31 +0100
Subject: [Buildroot] [PATCH 01/51] core/pkg-autotools: align host configure
	commands to target one
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <854b1db65905a9bbcb442fd5ce0c1fb92ca365af.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host configure commands are not indented the same way as the target
ones. Besides, there are leading spaces (instead of TABs) on one line.

Replicate the same indentation as used for the target commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 4787914..502eeea 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -214,12 +214,12 @@ else
 # installed.
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
-	        $$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$$(HOST_CFLAGS)" \
-		LDFLAGS="$$(HOST_LDFLAGS)" \
-		$$($$(PKG)_CONF_ENV) \
-		CONFIG_SITE=/dev/null \
-		./configure \
+	$$(HOST_CONFIGURE_OPTS) \
+	CFLAGS="$$(HOST_CFLAGS)" \
+	LDFLAGS="$$(HOST_LDFLAGS)" \
+	$$($$(PKG)_CONF_ENV) \
+	CONFIG_SITE=/dev/null \
+	./configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--localstatedir="$$(HOST_DIR)/var" \
-- 
1.9.1
