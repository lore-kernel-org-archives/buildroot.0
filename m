From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:26:28 +0100
Subject: [Buildroot] [git commit] package/tpm2-abrmd: fix build without
 stack smashing protection (SSP)
Message-ID: <20181203122304.8EC898A4AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=445a6d40cbe0f162cbb8832601b9b95f7e0d8637
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configuration environment setup that disables SSP if the toolchain
does not support it must be updated after the bump to version 2.0.3.

Fixes:
  http://autobuild.buildroot.net/results/bd9005eeb24678aa530179a80bbc99b2176f8559
  http://autobuild.buildroot.net/results/feff61dcb481a94f5f030117830984c5e09727ea

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index a4d9cfb384..74cc66ba20 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -13,7 +13,7 @@ TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
 
 # configure.ac doesn't contain a link test, so it doesn't detect when
 # libssp is missing.
-TPM2_ABRMD_CONF_ENV = ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+TPM2_ABRMD_CONF_ENV = ax_cv_check_cflags___________Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 TPM2_ABRMD_CONF_OPTS += \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
