From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  1 Sep 2017 11:34:33 +0300
Subject: [Buildroot] [PATCH 2/3] gnupg2: drop non-wchar toolchain workaround
In-Reply-To: <8e3276a52f2c7f2b28ce726f096b6225fd52595f.1504254874.git.baruch@tkos.co.il>
References: <8e3276a52f2c7f2b28ce726f096b6225fd52595f.1504254874.git.baruch@tkos.co.il>
Message-ID: <863908b6c892bafc62b4a4c052bbea571162ba27.1504254874.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 removed gnulib in version 2.1.1. The workaround for non-wchar
toolchains introduced in commit 8a878870958 (gnupg2: fix build on
non-wchar toolchains), is no longer needed.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 4bf9cfcea5dc..9145f2351dc6 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -19,7 +19,6 @@ GNUPG2_CONF_OPTS = \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-npth-prefix=$(STAGING_DIR)/usr
-GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
-- 
2.14.1
