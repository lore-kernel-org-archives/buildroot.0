From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:55 +0200
Subject: [Buildroot] [git commit] execline: remove --shebangdir configure
	option
Message-ID: <20170705141338.0582681D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fd1d54ab6fe079bbaefe4d5dfe29d131402a106
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host build passes the --shebangdir configure option, the target
build doesn't.  With the removal of $(HOST_DIR)/usr, it is not clear
if this should be /bin or /usr/bin or $(HOST_DIR)/bin. Looking at the
source code, it turns out that this variable is not used at all, and
/usr/bin doesn't appear anywhere in the installed files.

Since it is not clear what this option should be set to, and it
anyway doesn't do anything, remove it entirely.

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/execline/execline.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 50c3fca..d3d69a8 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -46,7 +46,6 @@ HOST_EXECLINE_DEPENDENCIES = host-skalibs
 
 HOST_EXECLINE_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
-	--shebangdir=/usr/bin \
 	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/include \
 	--with-dynlib=$(HOST_DIR)/lib \
