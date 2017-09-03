From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:21:31 +0200
Subject: [Buildroot] [git commit] gnupg2: drop non-wchar toolchain workaround
Message-ID: <20170903121429.26B1B7FB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72007d80d43408e195906920bcf6842dcdc60201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnupg2 removed gnulib in version 2.1.1. The workaround for non-wchar
toolchains introduced in commit 8a878870958 (gnupg2: fix build on
non-wchar toolchains), is no longer needed.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 4bf9cfc..9145f23 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -19,7 +19,6 @@ GNUPG2_CONF_OPTS = \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-npth-prefix=$(STAGING_DIR)/usr
-GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
