From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 21:38:18 +0200
Subject: [Buildroot] [git commit] log4cpp: disable documentation build and
	install
Message-ID: <20160614194040.6A5087FFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf20a49d4c2f064015b4d437a7cd98c6dd8ce4ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need the documentation on target.

Also fixes:
http://autobuild.buildroot.net/results/402/402587fe3ba9d537195ba470cf6f19f25ac246bf/
http://autobuild.buildroot.net/results/ea2/ea257496f51665b0a6b03f31e50744761c5d43da/
http://autobuild.buildroot.net/results/353/3533a32a7de7dae288558f43eb2b068081939e4d/

and many more.

Cc: Damien Lanson <damien@kal-host.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cpp/log4cpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 24f9a0d..1630b90 100755
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -13,6 +13,7 @@ LOG4CPP_SUBDIR = log4cpp
 LOG4CPP_LICENSE = LGPLv2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
+LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
 
 # The default <pkg>_CONFIG_SCRIPTS handling does not apply
 define LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
