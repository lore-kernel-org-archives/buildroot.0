From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/crosstool-NG: use LFS
	option
Message-ID: <20101127214029.C30518CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32dd477465f70cb31014967e880c839b713394b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Push the LFS option down to uClibc config

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index e944b93..97224a1 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -238,6 +238,13 @@ else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_WCHAR)=.*:\# \1 is not set:;
 endif
 
+# Handle the LFS option
+ifneq ($(call qstrip,$(BR2_LARGEFILE)),)
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_LFS) is not set:\1=y:;
+else
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_LFS)=.*:\# \1 is not set:;
+endif
+
 # Instruct CT-NG's .config where to find the uClibc's .config
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
 
-- 
1.7.2.2
