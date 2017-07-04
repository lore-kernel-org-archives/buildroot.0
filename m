From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:11 +0200
Subject: [Buildroot] [git commit] e2fsprogs: remove libintl static linking
	handling
Message-ID: <20170704233519.ED0247FBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b198cedc5007e6777efcedd2a6d9e2ff9952f65d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
special code in e2fsprogs that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 84af7ab..75e9213 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -77,12 +77,6 @@ HOST_E2FSPROGS_CONF_ENV += \
 	ac_cv_header_magic_h=no \
 	ac_cv_lib_magic_magic_file=no
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
-# util-linux libuuid pulls in libintl if needed, so ensure we also
-# link against it, otherwise static linking fails
-E2FSPROGS_CONF_ENV += LIBS=-lintl
-endif
-
 E2FSPROGS_MAKE_OPTS = LDCONFIG=true
 
 E2FSPROGS_INSTALL_STAGING_OPTS = \
