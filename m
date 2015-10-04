From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:45 +0100
Subject: [Buildroot] [PATCH v2 05/18] perl: Remove ccache handling
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now the ccache handling has moved to the toolchain wrapper, it is no
longer necessary to pass TARGET_CC_NOCCACHE.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: No change
---
 package/perl/perl.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b9f90e4..7192700 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -45,13 +45,12 @@ PERL_DEPENDENCIES += gdbm
 endif
 
 # We have to override LD, because an external multilib toolchain ld is not
-# wrapped to provide the required sysroot options.  We also can't use ccache
-# because the configure script doesn't support it.
+# wrapped to provide the required sysroot options.
 PERL_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--target-tools-prefix=$(TARGET_CROSS) \
 	--prefix=/usr \
-	-Dld="$(TARGET_CC_NOCCACHE)" \
+	-Dld="$(TARGET_CC)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
 	-Dmydomain="" \
-- 
2.5.3
