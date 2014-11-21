From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 21:50:59 +0100
Subject: [Buildroot] [git commit] toolchain: do not allow locale generation
	when locale support is not available
Message-ID: <20141121205146.863E77FE1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cce0add500b6d701724a90468eb34e6bda6f4ae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the C library being used is uClibc, the locale support can be
disabled. In this case, it does not make sense to show the "Generate
locales" option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 683c143..ad04d64 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -69,7 +69,7 @@ config BR2_GENERATE_LOCALE
 	string "Generate locale data"
 	default ""
 	depends on \
-		BR2_TOOLCHAIN_BUILDROOT_UCLIBC || \
+		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
 		BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Generate support for a list of locales. Locales can be
