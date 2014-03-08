From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  8 Mar 2014 14:54:41 +0100
Subject: [Buildroot] [PATCH] perl: needs MMU
Message-ID: <1394286881-27569-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see build http://autobuild.buildroot.net/results/ba7/ba71d0d532ccd8e16b727cddd5dcaa5521074945/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index b2991b0..cdd5aab 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL
 	bool "perl"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Larry Wall's Practical Extraction and Report Language
 	  An interpreted scripting language, known among some as "Unix's Swiss
-- 
1.7.9.5
