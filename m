From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 19:47:09 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] wget: add optional zlib
	support
Message-ID: <20171028174327.5070981137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8232ff1ed3766446f52095671497ab454dab94c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aff7673602d21b599470227edf323e72831dd3eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 1081bb9..719e2da 100644
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
