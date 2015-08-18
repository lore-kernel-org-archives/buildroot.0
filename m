From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 22:45:48 +0200
Subject: [Buildroot] [git commit] libiio: test programs require threads
Message-ID: <20150818204600.E892B81E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9b6ad84f1787cd36dd4a346a737e5de7f4a25ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/228/228a32167d05337acf17b0e3689aa91e8a67d8fb/
http://autobuild.buildroot.net/results/86a/86adb968659fec56684ba80e1c4230230fd7a1c8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 21496ed..99da4c1 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -37,9 +37,13 @@ config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Install the test programs (iio_info, iio_genxml, iio_readdev).
 
+comment "IIO test programs need a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
 	bool "Install C# bindings"
 	depends on BR2_PACKAGE_MONO
