From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 22:27:42 +0100
Subject: [Buildroot] [git commit] package/sysklogd: needs threads
Message-ID: <20210121210841.4B5AF83E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44f1f423f809027b589508f85c7e8645c0db8cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

threads is mandatory since version 2.0 and
https://github.com/troglobit/sysklogd/commit/f6e17bd6b30397912dcae33842b7aba8d32710a2

Fixes:
 - http://autobuild.buildroot.org/results/33846ba0c6746c2befcd3c3ce0bbe0c5b32669ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr: reorder dependencies]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 18aff091c0..90649caa83 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "sysklogd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  The continuation of the original sysklogd package, based on
@@ -11,3 +12,8 @@ config BR2_PACKAGE_SYSKLOGD
 	  clients.
 
 	  https://github.com/troglobit/sysklogd/
+
+comment "sysklogd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
