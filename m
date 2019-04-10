From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 12:02:49 +0200
Subject: [Buildroot] [git commit] package/gettext-gnu: fix typo
 BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL
Message-ID: <20190410095859.486188E1D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c2aa19a292ec8b0e4edf439483a27e1ae12bfb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit:

	ea1e7ee606 package/gettext: turn into virtual package

package/gettext was renamed to package/gettext-gnu and introduced typo
BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL which should be
BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL (w/o "_GNU" part).

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-gnu/gettext-gnu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 61adf72738..c63ad8cb36 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -42,7 +42,7 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
 
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
-ifeq ($(BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL),y)
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 GETTEXT_GNU_CONF_OPTS += --with-included-gettext
 else
 GETTEXT_GNU_CONF_OPTS += --without-included-gettext
