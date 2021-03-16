From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:13:31 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/asterisk: remove
 default -O3 optimization flag
Message-ID: <20210316215256.6A51D882C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe9fd36e30325a946e206db6c5195f88f210076a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Actually asterisk package gets built with -O3 cflag since it's defaulted
into its sources, but it's not what we want, so let's empty its OPTIMIZE
Makefile variable letting Buildroot CFLAGS to take place instead.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eaba3c8e131e21c4bae79483211685942e035300)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index fb3eb6ec8a..6de941c8f0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -277,6 +277,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ASTERISK_MAKE_OPTS += ASTLDFLAGS="-latomic"
 endif
 
+# Remove default -O3 optimization flag
+ASTERISK_MAKE_OPTS += OPTIMIZE=""
+
 # We want to install sample configuration files, too.
 ASTERISK_INSTALL_TARGET_OPTS = \
 	$(ASTERISK_DIRS) \
