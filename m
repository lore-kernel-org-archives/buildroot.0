From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 15:05:36 +0100
Subject: [Buildroot] [git commit] attr: disable gettext for host variant
Message-ID: <20160303140922.A863E7FD93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=039c5dcfac21d185c338eb2b0ff68e8e31f54c75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it leads to build failure and we don't need it. Fixes:
http://autobuild.buildroot.net/results/59e/59e7e1db122523b292d34405df6dca9faa616da2/

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/attr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 3db66cb..4d5a07d 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -9,6 +9,7 @@ ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPTS = --enable-gettext=no
+HOST_ATTR_CONF_OPTS = --enable-gettext=no
 ATTR_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
