From: Will Newton <will.newton@gmail.com>
Date: Fri, 30 Mar 2012 09:04:52 +0100
Subject: [Buildroot] [PATCH] libxml-parser-perl: Pass USE_MM_LD_RUN_PATH to
	MakeMaker.
Message-ID: <CAFbHwiS6diQ_fskroM0bDEqHgxCvy2w3jP2-s7o1RcrK9mzhcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Red Hat versions of perl do not honour the setting of LD_RUN_PATH
without this option. This leads to perl shared objects being installed
without an rpath set which causes problems for target tools when
searching for dependant shared libraries.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk
b/package/libxml-parser-perl/libxml-parser-perl.mk
index 9e6f2ec..70d0918 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -18,6 +18,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
         INSTALLDIRS=site \
         INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
         INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
+	USE_MM_LD_RUN_PATH=1 \
  )
 endef

-- 
1.7.1
-------------- next part --------------
