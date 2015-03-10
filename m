From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:02:28 +0100
Subject: [Buildroot] [git commit] softether: fix static linking with openssl
Message-ID: <20150310190317.2AFC181809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c108b34e85aba9109317a039f352128724b9bc81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openssl uses zlib, so ensure we also link against it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softether/softether.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 3b1ce40..8f8734d 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -19,6 +19,11 @@ SOFTETHER_DEPENDENCIES += libiconv
 SOFTETHER_CONF_ENV = LIBS+=" -liconv"
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# openssl needs zlib
+SOFTETHER_CONF_ENV += LIBS+=" -lz"
+endif
+
 SOFTETHER_CONF_OPTS = \
 	--with-openssl="$(STAGING_DIR)/usr" \
 	--with-zlib="$(STAGING_DIR)/usr"
