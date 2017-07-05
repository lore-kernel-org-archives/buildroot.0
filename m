From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:53 +0200
Subject: [Buildroot] [PATCH v4 36/36] execline: remove --shebangdir
	configure option
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-37-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host build passes the --shebangdir configure option, the target
build doesn't.  With the removal of $(HOST_DIR)/usr, it is not clear
if this should be /bin or /usr/bin or $(HOST_DIR)/bin. Looking at the
source code, it turns out that this variable is not used at all, and
/usr/bin doesn't appear anywhere in the installed files.

Since it is not clear what this option should be set to, and it
anyway doesn't do anything, remove it entirely.

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/execline/execline.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 50c3fca3f5..d3d69a85d9 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -46,7 +46,6 @@ HOST_EXECLINE_DEPENDENCIES = host-skalibs
 
 HOST_EXECLINE_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
-	--shebangdir=/usr/bin \
 	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(HOST_DIR)/include \
 	--with-dynlib=$(HOST_DIR)/lib \
-- 
2.13.2
