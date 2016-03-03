From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu,  3 Mar 2016 09:03:38 -0300
Subject: [Buildroot] [PATCH] attr: disable gettext for host variant
Message-ID: <1457006618-4901-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Otherwise it leads to build failure and we don't need it. Fixes:
http://autobuild.buildroot.net/results/59e/59e7e1db122523b292d34405df6dca9faa616da2/

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
 
-- 
2.4.10
