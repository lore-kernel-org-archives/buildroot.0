From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 09:10:11 +0200
Subject: [Buildroot] [git commit] wget: add optional zlib support
Message-ID: <20171028070346.C9460802C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aff7673602d21b599470227edf323e72831dd3eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index a7d9044..3fee8e1 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -30,4 +30,11 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 WGET_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WGET_CONF_OPTS += --with-zlib
+WGET_DEPENDENCIES += zlib
+else
+WGET_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
