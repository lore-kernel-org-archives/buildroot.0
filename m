From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:38:08 +0100
Subject: [Buildroot] [git commit] package/uclibc: needs a host with an UTF8
	locale to build locales
Message-ID: <20161204143830.C095B7F96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70da1d7c46415f4ed231af8598839fc779b130ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index eb002c1..a200154 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -41,6 +41,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 	bool "Enable toolchain locale/i18n support"
 	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
 	select BR2_ENABLE_LOCALE
+	select BR2_NEEDS_HOST_UTF8_LOCALE
 	help
 	  Enable this option if you want your toolchain to support
 	  localization and internationalization.
