From: Heiko Helmle <helman@gmx.net>
Date: Fri, 12 Aug 2011 21:14:28 +0200
Subject: [Buildroot] [PATCH] libxml-parser-perl: fix install bug
Message-ID: <20110812191428.101290@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List,

This patch makes libxml-parser-perl behave on my system - though it looks like it isn't necessary on all host OSses (on gentoo and opensuse it works without, but on ubuntu lucid and Scientific 6 it fails without the patch).

Signed-off-by: Heiko Helmle <helman@gmx.net>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | ? ?1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 52d89d5..9f80cf9 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -18,6 +18,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 ? ? ? ? EXPATINCPATH=$(HOST_DIR)/usr/include \
 ? ? ? ? INSTALLDIRS=site \
 ? ? ? ? INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
+ ? ? ? ?INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
 ?)
 endef
 
-- 
1.7.1
