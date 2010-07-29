From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:45 +0200
Subject: [Buildroot] [PATCH 02/19] oprofile: disable with external toolchain
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d58a827fe558c09c2cce01b20e9a1e1bc8534e33.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oprofile depends on binutils_target, but binutils_target fails to
build with external toolchains because the binutils version has not
been choosen. As the fix is not trivial, let's just disable oprofile
in external toolchain builds for the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 770b555..c877dae 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
+	# The dependency on binutils_target does not work with
+	# external toolchains since the binutils version was not
+	# choosen in the config. This will have to be fixed later.
+	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_POPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-- 
1.7.0.4
