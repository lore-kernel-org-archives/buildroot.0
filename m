From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:22:28 +0200
Subject: [Buildroot] [git commit] libgcrypt: allow optimization
Message-ID: <20150531082235.7E21E8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32e4bceaebdd40f5ab482243cc17930a2aa673a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the --disable-optimization option, which makes the libgcrypt configure
remove buildroot's optimization setting passed in from CFLAGS.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgcrypt/libgcrypt.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 57c5ab1..9153fb8 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -16,7 +16,6 @@ LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
 LIBGCRYPT_CONF_OPTS = \
-	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 # Code doesn't build in thumb mode
