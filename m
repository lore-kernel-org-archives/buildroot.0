From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:18:01 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/libxml-parser-perl: make host build use correct compiler
Message-ID: <20200911211225.4E7528863C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6271e78ef925ca34743f58b65d97961ded1343e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This package uses gcc filename without absolute path, which breaks
the host build if host and target compiler have the same filename.
(Can happen with an external toolchain).

This patch adds the variables for the host as overrides,
as they are otherwise not picked up from the environment.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit efa95b19aeab6bdcd7d5a620e199c2c32cf2516b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
