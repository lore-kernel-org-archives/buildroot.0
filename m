From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:47:07 +0100
Subject: [Buildroot] [git commit] intltool: host variant needs host-gettext
Message-ID: <20130330194755.703D69B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=421d9d636271e5872d10a521922b06683ab967b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes issues like:
http://autobuild.buildroot.net/results/1c7d2e50b622179aff469fddedaa4dc2015fb496/
http://autobuild.buildroot.net/results/7d85ff51b339f1da720bb079eb05e7fba179f101/
and probably a lot more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/intltool/intltool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 19b5238..1a32a79 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -8,7 +8,7 @@ INTLTOOL_VERSION = 0.40.6
 INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
 INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
 
-HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
+HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
   PERLLIB=$(HOST_DIR)/usr/lib/perl
 
