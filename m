From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:40:57 +0100
Subject: [Buildroot] [git commit] mongrel2: add missing comment for
	toolchain option dependencies
Message-ID: <20131219204306.D742E9C0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f05e3c9ab61ff5ee03fb296e234a98e636869720
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongrel2/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 435d97e..680e0ce 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -1,3 +1,10 @@
+comment "mongrel2 needs a toolchain w/ C++, IPv6, threads, largefile, wchar"
+	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
+		BR2_TOOLCHAIN_USES_GLIBC || \
+		BR2_arm
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
 	select BR2_PACKAGE_SQLITE
