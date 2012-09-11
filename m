From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Sep 2012 09:13:11 +0200
Subject: [Buildroot] [git commit] lcdproc: fix build with high BR2_JLEVEL
	setting
Message-ID: <20120911071421.3C9F599604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b9e61f9234165db1f70021396c8d59c2d52d3ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/646db4b6b284beb4392759a57efffc8d10ee9f49

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lcdproc/lcdproc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index e4944da..7fd8a44 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -8,6 +8,7 @@ LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPLv2+
 LCDPROC_LICENSE_FILES = COPYING
+LCDPROC_MAKE = $(MAKE1)
 
 LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
