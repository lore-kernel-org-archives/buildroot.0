From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:49:05 +0200
Subject: [Buildroot] [git commit] package/wget: add optional dependency to
 libiconv
Message-ID: <20200412133503.5503A8E778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3460121b14899960cfd7bced43e914bbc758152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wget has an optional dependency to libiconv:
http://git.savannah.gnu.org/cgit/wget.git/tree/configure.ac#n344

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
