From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Nov 2018 21:25:13 +0100
Subject: [Buildroot] [git commit] ncmpc: disable documentation
Message-ID: <20181111202637.900318256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=243118288ff40add3d8447c9240cc7e42ad36403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4822b195628b3ce0d3fd6428bcba2cca158e92be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncmpc/ncmpc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index f981ce5f7d..787f58201a 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -12,7 +12,9 @@ NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
 
-NCMPC_CONF_OPTS = -Dcurses=ncurses
+NCMPC_CONF_OPTS = \
+	-Dcurses=ncurses \
+	-Ddocumentation=false
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
