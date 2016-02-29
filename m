From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:46:32 +0100
Subject: [Buildroot] [git commit branch/next] lirc-tools: also install to
	staging
Message-ID: <20160229205038.D64338180E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0071cddc0eb2cd7569b2c25d817cabafcef2993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds LIRC_TOOLS_INSTALL_STAGING = YES to the lirc-tools
package to get the library headers into sysroot, which is needed to
develop lirc based applications.

Signed-off-by: Michael Schenk <michael.schenk@albistechnologies.com>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/lirc-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index fbd8aaf..d366a83 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -10,6 +10,7 @@ LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOL
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-pkgconf
+LIRC_TOOLS_INSTALL_STAGING = YES
 
 LIRC_TOOLS_CONF_OPTS = --without-x
 
