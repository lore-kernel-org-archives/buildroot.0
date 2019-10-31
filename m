From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:25:59 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libsigrok: fix
 libftdi support
Message-ID: <20191031203358.BB3F18B7AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3984439bce464e5f9896a337644756bd3c8e5cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

libsigrok optionally depends on libftdi1, not libftdi. This was already
the case for a long time, but until the recent commit 01b30e5d69f, all
the configure options were wrong so it would use the automatic check for
availability of libftdi1. Now we pass the --with-libftdi option
explicitly, configure will fail if libftdi1 is not available.

Fixes:
 - http://autobuild.buildroot.net/results/ec1f9f57944139b24738c1be529c4fc4b128a516

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 658388138ceba022c0db7ddb30a453140911f994)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index c65d63eb2a..aa79191e94 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -19,9 +19,9 @@ else
 LIBSIGROK_CONF_OPTS += --without-libserialport
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 LIBSIGROK_CONF_OPTS += --with-libftdi
-LIBSIGROK_DEPENDENCIES += libftdi
+LIBSIGROK_DEPENDENCIES += libftdi1
 else
 LIBSIGROK_CONF_OPTS += --without-libftdi
 endif
