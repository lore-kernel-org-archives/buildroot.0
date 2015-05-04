From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 May 2015 23:35:51 +0200
Subject: [Buildroot] [PATCH] package/neard: needs shared libs
Message-ID: <1430775351-16684-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

neard uses dlopen(), so needs shared libs.

Fixes:
    http://autobuild.buildroot.org/results/0a4/0a466cde55c5e128a2e201924f80f0ec6b8b5c2a/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: the only package that selects neard is connman, and it already
depends on !static.
---
 package/neard/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index ed20e06..71d979b 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NEARD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNL
-- 
1.9.1
