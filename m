From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:58:12 +0200
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: make host build use
 correct compiler
Message-ID: <20200605225812.13944-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses gcc filename without path, which breaks the host build
if host and target compiler have the same filename.
We pack the HOST variables as override so absolute paths are used for
the host tools.
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index fcde5fc939..100c49633c 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -25,7 +25,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 endef
 
 define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
-- 
2.26.2
