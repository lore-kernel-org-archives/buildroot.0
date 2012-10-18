From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Oct 2012 09:10:32 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-ng: vendor part of
	tuple should be 'buildroot'
Message-ID: <20121018071118.420E7998A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=965cab82af11943ed52ed70aafc9f72c79744664
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 11017f081fc5b034e680d89eaea729c19f450e01, the Crosstool-ng
backend generates toolchains that have a prefix inconsistent with what
Buildroot expects. Buildroot expects a "buildroot" vendor name, while
Crosstool-NG builds toolchain with the "unknown" vendor name.

This is causing build failure such as:

  http://autobuild.buildroot.org/results/15b2c0e50a81b86dd13af684c9254df2bc0df8de/build-end.log

Fix this by changing the vendor part of the tuple used by Crosstool-NG
to "buildroot".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index d18f5d5..e46bb20 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -201,7 +201,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="unknown":;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="buildroot":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(ARCH)-linux":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
 ifneq ($(call qstrip,$(BR2_USE_MMU)),)
