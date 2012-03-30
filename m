From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Mar 2012 10:11:40 +0200
Subject: [Buildroot] [git commit] libxml-parser-perl: Pass
	USE_MM_LD_RUN_PATH to MakeMaker.
Message-ID: <20120330081525.4EDDF969B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bff1dde4b753e986c36858dd9e6afd04eb054ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Red Hat versions of perl do not honour the setting of LD_RUN_PATH
without this option. This leads to perl shared objects being installed
without an rpath set which causes problems for target tools when
searching for dependant shared libraries.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml-parser-perl/libxml-parser-perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 1022302..0d02981 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -24,6 +24,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
         INSTALLDIRS=site \
         INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
         INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
+        USE_MM_LD_RUN_PATH=1 \
  )
 endef
 
