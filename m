From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] perl: Remove ccache handling
Message-ID: <20151004162324.E360781D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=906a01128c3537c0e255bb0c66384fbde4ac6a97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now the ccache handling has moved to the toolchain wrapper, it is no
longer necessary to pass TARGET_CC_NOCCACHE.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
