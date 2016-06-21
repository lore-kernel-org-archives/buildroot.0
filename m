From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Jun 2016 15:16:01 +0300
Subject: [Buildroot] [PATCH] fwup: disable documentation build
Message-ID: <dcd45c085506be96cfcec71a7357ddeba84c2df3.1466511361.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Documentation build with help2man relies on the output of running 'fwup
--help'. That obviously can't work with cross compilation.

Fixes:
http://autobuild.buildroot.net/results/bdd/bdd8137973c37824f6aa9261ee307f6ed21b9166/
http://autobuild.buildroot.net/results/96a/96a53b3ec666bd09f09c8a3e5b31eff73e3dd0fa/
http://autobuild.buildroot.net/results/e0b/e0bcfaf9dd36d4992e507d18afeb1cec56048987/

Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/fwup/fwup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 7b007e1a9c8a..0a23856048b3 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -10,6 +10,7 @@ FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = libconfuse libarchive libsodium
 FWUP_AUTORECONF = YES
+FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.8.1
