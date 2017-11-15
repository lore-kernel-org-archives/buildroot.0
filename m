From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Nov 2017 19:47:46 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] wget: add optional zlib
 support
Message-ID: <20171115184825.189E08047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3f1c844a65078881d1057f7c333d753069fd20d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aff7673602d21b599470227edf323e72831dd3eb)
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
