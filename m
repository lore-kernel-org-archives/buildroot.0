From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:15:13 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/wget: add
 optional dependency to libiconv
Message-ID: <20200430124925.5A8C68E8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=435e4692e66e3dfc5ebd7b13b9ad2ef72a63b657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

wget has an optional dependency to libiconv:
http://git.savannah.gnu.org/cgit/wget.git/tree/configure.ac#n344

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a3460121b14899960cfd7bced43e914bbc758152)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 7b9c3e75d9..ed3f1fdff9 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -21,6 +21,10 @@ else
 WGET_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+WGET_DEPENDENCIES += libiconv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 WGET_CONF_OPTS += --with-libidn
 WGET_DEPENDENCIES += libidn2
