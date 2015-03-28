From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Mar 2015 12:48:01 +0100
Subject: [Buildroot] [PATCH 4/4] package/powertop: Fix download problems
In-Reply-To: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427543281-11901-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depend on host-wget which uses gnutls to avoid certificate problems

For reference read
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=652480#20

Fixes
http://autobuild.buildroot.net/results/962/962f6ab48f3414cf465dcd7c40ea19494b6be8b9/
http://autobuild.buildroot.net/results/db6/db632c9fa2fc816790809c685b636175173640de/
http://autobuild.buildroot.net/results/e77/e77da9b39cdcb8730b5650924ba640170f79379c/
http://autobuild.buildroot.net/results/a3a/a3a4bb08b266222e90d2a3f915981c87baaed420/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/powertop/powertop.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 331edc9..026163a 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -6,7 +6,7 @@
 
 POWERTOP_VERSION = 2.7
 POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
-POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
+POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf host-wget
 POWERTOP_LICENSE = GPLv2
 POWERTOP_LICENSE_FILES = COPYING
 # We're patching Makefile.am
-- 
1.7.10.4
