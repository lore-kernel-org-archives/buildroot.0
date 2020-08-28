From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:04:20 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/openfpgaloader:
 C++ dependency is not inherited
Message-ID: <20200828170226.6F6668377C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1e60d3fd054aa072868ddcf0cdcde1ac5373162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

openfpgaloader is written in C++, so the dependency on C++ is not
inherited from libftdipp1.

Drop the confusing comment.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1ca0077d9141fff62c179bd2d17cfd6656a7d8a3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openfpgaloader/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 9835b84b64..fb199d9e7a 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OPENFPGALOADER
 	bool "openfpgaloader"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi1
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libftdipp1
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL # argp
