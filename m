From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Oct 2014 09:30:29 +0200
Subject: [Buildroot] [git commit] libshout: fix typo
Message-ID: <20141018073257.DCE7EB384C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba5184a8319373e8f92c373de6a2e6c41e706041
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix error:
  package/libshout/libshout.mk:28: *** Package error: use LIBSHOUT_CONF_OPTS instead of LIBSHOUT_CONF_OPT. Please fix your .mk file.  Stop.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 1166f58..faee3eb 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -19,7 +19,7 @@ LIBSHOUT_CONF_OPTS += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
-LIBSHOUT_CONF_OPT += --enable-speex
+LIBSHOUT_CONF_OPTS += --enable-speex
 LIBSHOUT_DEPENDENCIES += speex
 else
 LIBSHOUT_CONF_OPTS += --disable-speex
