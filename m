From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:33:10 +0200
Subject: [Buildroot] [git commit] e2fsprogs: only add -lintl for static
	builds
Message-ID: <20170504203649.391388257A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a269100ea1fb1e8f38c74174d801ad1204877fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For dynamic library builds, it's not needed to pass it explicitly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index a60c69b..70a1e4e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -77,7 +77,7 @@ HOST_E2FSPROGS_CONF_ENV += \
 	ac_cv_header_magic_h=no \
 	ac_cv_lib_magic_magic_file=no
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
 # util-linux libuuid pulls in libintl if needed, so ensure we also
 # link against it, otherwise static linking fails
 E2FSPROGS_CONF_ENV += LIBS=-lintl
