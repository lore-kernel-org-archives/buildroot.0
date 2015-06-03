From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:37 +0200
Subject: [Buildroot] [PATCH 20/32 v2] package/matchbox: forcibly disable
	gconf
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <ce08e4784d440d05b73ce067f0bf49e2c8911fba.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot does not have a gconf package, so explicitly disable gconf
support (to avoid it ends up picking the host one).

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/matchbox/matchbox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 29e240e..0899208 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -11,7 +11,7 @@ MATCHBOX_LICENSE = GPLv2+
 MATCHBOX_LICENSE_FILES = COPYING
 
 MATCHBOX_DEPENDENCIES = matchbox-lib
-MATCHBOX_CONF_OPTS = --enable-expat
+MATCHBOX_CONF_OPTS = --enable-expat --disable-gconf
 
 # Workaround bug in configure script
 MATCHBOX_CONF_ENV = expat=yes
-- 
1.9.1
