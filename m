From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:07 +0200
Subject: [Buildroot] [PATCH 15/20] libxml-parser-perl/intltool: mark as host
	only packages
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <210878dc5d0bf4c6c1ea0f32e874a2a93bb4489a.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxml-parser-perl and intltool were originally added to be built on
the host, and we don't support building them on the target. So, let's
mark them as such in the configuration, so that a random package
configuration does not pick them up. We might later add target support
for them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/intltool/Config.in           |    3 +++
 package/libxml-parser-perl/Config.in |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/intltool/Config.in b/package/intltool/Config.in
index 94b34f7..990a227 100644
--- a/package/intltool/Config.in
+++ b/package/intltool/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_INTLTOOL
        bool "intltool"
+       # Hide from configuration as we only support the host package
+       # for the moment
+       depends on BR2_HOST_ONLY
        help
          Utility scripts for internationalizing XML
 
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
index d20a401..e90e50e 100644
--- a/package/libxml-parser-perl/Config.in
+++ b/package/libxml-parser-perl/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_LIBXML_PARSER_PERL
        bool "libxml-parser-perl"
        select BR2_PACKAGE_EXPAT
+       # Hide from configuration as we only support the host package
+       # for the moment
+       depends on BR2_HOST_ONLY
        help
          The Perl XML::Parser module.
 
-- 
1.7.0.4
