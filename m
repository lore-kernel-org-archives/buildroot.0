From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Aug 2011 10:03:18 +0200
Subject: [Buildroot] [git commit] libxml-parser-perl: fix install bug
Message-ID: <20110814090740.C17428C98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=323dcc076a03acdd407f6d254fe8c9c2fcd464b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes libxml-parser-perl behave on my system - though it looks
like it isn't necessary on all host OSses (on gentoo and opensuse it works
without, but on ubuntu lucid and Scientific 6 it fails without the patch).

Signed-off-by: Heiko Helmle <helman@gmx.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml-parser-perl/libxml-parser-perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 52d89d5..9f80cf9 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -18,6 +18,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
         EXPATINCPATH=$(HOST_DIR)/usr/include \
         INSTALLDIRS=site \
         INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
+        INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
  )
 endef
 
-- 
1.7.3.4
