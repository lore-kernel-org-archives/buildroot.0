From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:55:09 +0100
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: add p11-kit optional
 dependency
Message-ID: <20210207093542.B259C813E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a0315f7d48cef96618ce1add1fb8c0ddd60e487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/fee607da7226a92cceab2bbfd4c5d031016dfa3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-pkcs11/tpm2-pkcs11.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index fb3846f056..3acce07745 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -37,4 +37,10 @@ TPM2_PKCS11_CONF_ENV += \
 	ac_cv_prog_tpm2_import=yes \
 	ac_cv_prog_tpm2_changeauth=yes
 
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+TPM2_PKCS11_DEPENDENCIES += p11-kit
+TPM2_PKCS11_CONF_OPTS += \
+	--with-p11kitconfigdir=/usr/share/p11-kit/modules
+endif
+
 $(eval $(autotools-package))
