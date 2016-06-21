From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jun 2016 16:40:36 +0200
Subject: [Buildroot] [git commit] fwup: disable documentation build
Message-ID: <20160621144450.E9608817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d99eb3cef92fe1bd21b5e1347f0f93bdb2df5df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Documentation build with help2man relies on the output of running 'fwup
--help'. That obviously can't work with cross compilation.

Fixes:
http://autobuild.buildroot.net/results/bdd/bdd8137973c37824f6aa9261ee307f6ed21b9166/
http://autobuild.buildroot.net/results/96a/96a53b3ec666bd09f09c8a3e5b31eff73e3dd0fa/
http://autobuild.buildroot.net/results/e0b/e0bcfaf9dd36d4992e507d18afeb1cec56048987/

Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwup/fwup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 7b007e1..0a23856 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -10,6 +10,7 @@ FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = libconfuse libarchive libsodium
 FWUP_AUTORECONF = YES
+FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
