From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 16:05:04 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-abrmd: add missing
 backslash
Message-ID: <20190125150506.9631A8E6B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9aeadd754c25bcea5ec26d9cd9e4917227cd670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Commit e04ae696d4f (tpm2-abrmd: fix build with BR2_FORTIFY_SOURCE_1) missed
a backslash in TPM2_ABRMD_CONF_ENV, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index f3a6980c23..90d175fc67 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -15,7 +15,7 @@ TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
 # in the toolchain wrapper and CFLAGS are used instead
 TPM2_ABRMD_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector_all=no
+	ax_cv_check_cflags___fstack_protector_all=no \
 	ax_cv_check_ccppflags___U_FORTIFY_SOURCE=no \
 	ax_cv_check_ccppflags___D_FORTIFY_SOURCE_2=no
 
