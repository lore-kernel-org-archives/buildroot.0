From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:43:44 +0100
Subject: [Buildroot] [git commit] taskd: needs C++
Message-ID: <20160314224357.67D657FA57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea9d0c93974bffb69c0e8ad9086d32425d883d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's all C++ code... C++11 even, but it turns out to compile fine even
with gcc-4.5 (Arago toolchain).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taskd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 2836161..7a9a136 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TASKD
 	bool "taskd"
 	depends on BR2_USE_WCHAR # gnutls, util-linux
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -10,6 +11,6 @@ config BR2_PACKAGE_TASKD
 
 	  http://taskwarrior.org/
 
-comment "taskd needs a toolchain w/ wchar"
+comment "taskd needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
