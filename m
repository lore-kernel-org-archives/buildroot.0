From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Nov 2017 23:29:14 +0100
Subject: [Buildroot] [PATCH] support/config-fragments: update ARC toolchain
Message-ID: <20171113222914.1487-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the br-arcle-hs38 configuration fragment to use a
slightly updated ARC toolchain in which the RPATH of the ar and ranlib
tools have been manually fixed to be correct. This is a temporary
workaround until the issue gets resolved properly in the RPATH fixing
logic, and is needed to fix a number of build issues.

Fixes:

  http://autobuild.buildroot.net/results/0ae0d6eba6e2cd8d2298cc4ba6380b8c3e9dd86a/
  (libnl)

  http://autobuild.buildroot.net/results/fa9bdad8d8b57d1db7f22abdb063ade470e9f938/
  (pcsc-lite)

  http://autobuild.buildroot.net/results/fca2ad71c7d446e4738834a1f220d950bce5fddd/
  (alsa-lib)

  http://autobuild.buildroot.net/results/945c60ff942dfd3daa4da27f5e19470e3d97aed4/
  (libcap)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/autobuild/br-arcle-hs38.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
index 8484f62683..6020dae6d7 100644
--- a/support/config-fragments/autobuild/br-arcle-hs38.config
+++ b/support/config-fragments/autobuild/br-arcle-hs38.config
@@ -3,7 +3,7 @@ BR2_archs38=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2017.11-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2017.11-rc1.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-- 
2.13.6
