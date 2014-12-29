From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 14:22:53 +0100
Subject: [Buildroot] [PATCH 2/2] upmpdcli: add missing comment dependency
	propagation
In-Reply-To: <1419859373-13766-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419859373-13766-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419859373-13766-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli cannot be built with the Blackfin toolchains, but the comment
could be shown with such toolchains, which doesn't make sense. This
commit properly propagates the toolchain exceptions of the package
config symbol to the Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/Config.in | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.1.0
