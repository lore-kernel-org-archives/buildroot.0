From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:17:45 +0200
Subject: [Buildroot] [git commit] libzip: add optional gnutls support
Message-ID: <20180708101935.7095E863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5d1df1ba75f8acb97eb69d779b86bbeb472aa69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls support has been added since version 1.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libzip/libzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 0253a61cda..20c04122ec 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -18,6 +18,13 @@ else
 LIBZIP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_BZIP2=TRUE
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBZIP_DEPENDENCIES += gnutls
+LIBZIP_CONF_OPTS += -DENABLE_GNUTLS=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_GNUTLS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBZIP_DEPENDENCIES += openssl
 LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=ON
