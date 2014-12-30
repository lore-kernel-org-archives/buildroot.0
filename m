From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:58:14 +0100
Subject: [Buildroot] [git commit] upmpdcli: add missing comment dependency
	propagation
Message-ID: <20141230235848.DA581807DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab001acd4c543a41d586d918a1ecf3206678d80b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upmpdcli cannot be built with the Blackfin toolchains, but the comment
could be shown with such toolchains, which doesn't make sense. This
commit properly propagates the toolchain exceptions of the package
config symbol to the Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index b2925ec..8ccf861 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -19,6 +19,9 @@ config BR2_PACKAGE_UPMPDCLI
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "upmpdcli needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
