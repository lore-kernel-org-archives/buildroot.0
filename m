From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 21:20:26 +0200
Subject: [Buildroot] [git commit] rpm: Fix automagic dependency on openssl
Message-ID: <20120404200933.12E0696A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e42361bb01eb40c52e3f6de6e77bf761fff397c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpm/rpm.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 9f42ee1..4ce2ecb 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -13,6 +13,7 @@ RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I
 RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--without-selinux \
 	--without-python --without-perl \
+	--with-openssl=external \
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR)
