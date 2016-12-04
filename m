From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:38:06 +0100
Subject: [Buildroot] [git commit] core: add a kconfig option to require an
	UTF8 locale on the host
Message-ID: <20161204143830.B5886817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de0df997068ee56c4f37fdfaefc92c6c2a6a4c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This can be selected when we need the host to have an UTF-8 locale
(e.g. to build uClibc with support for locales).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 98096df..495b71c 100644
--- a/Config.in
+++ b/Config.in
@@ -84,6 +84,11 @@ config BR2_HOSTARCH_NEEDS_IA32_LIBS
 config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 	bool
 
+# Hidden boolean selected by packages that need the host to have an
+# UTF8 locale.
+config BR2_NEEDS_HOST_UTF8_LOCALE
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
