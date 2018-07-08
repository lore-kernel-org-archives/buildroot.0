From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:17:45 +0200
Subject: [Buildroot] [git commit] libzip: add optional openssl support
Message-ID: <20180708101935.68248863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=975dedc753121607300ff059591522b21c4350bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl support has been added since version 1.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libzip/libzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index d46bc17977..0253a61cda 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -18,4 +18,11 @@ else
 LIBZIP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_BZIP2=TRUE
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBZIP_DEPENDENCIES += openssl
+LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=OFF
+endif
+
 $(eval $(cmake-package))
