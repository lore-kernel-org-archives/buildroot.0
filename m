From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:29:09 +0100
Subject: [Buildroot] [PATCH 1 of 6] mongrel2: add missing comment for
 toolchain option dependencies
In-Reply-To: <patchbomb.1387398548@argentina>
References: <patchbomb.1387398548@argentina>
Message-ID: <1d6d2e0065eee0821d8d.1387398549@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: I treated the uClibc || eglibc || arm as a base (positive) dependency,
not mentioned in the comment.

 package/mongrel2/Config.in |  7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
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
