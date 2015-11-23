From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:36:35 +0100
Subject: [Buildroot] [git commit] core/pkg-autotools: align host configure
	commands to target one
Message-ID: <20151201232121.1F297802AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6858dd7410ee97546fc09d55a46e39289c456f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host configure commands are not indented the same way as the target
ones. Besides, there are leading spaces (instead of TABs) on one line.

Replicate the same indentation as used for the target commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
