From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] openssl: introduce
	BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
Message-ID: <20171021192125.55BBF804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=123e0c9fefcf53641b8e80254929d485a1783f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages that use openssl are not compatible with libressl, only
with the real openssl (known as libopenssl in Buildroot). So before we
add libressl as a provider for the openssl virtual package, we
introduce a BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL hidden option that
packages incompatible with LibreSSL will be able to select.

This will allow packages that need OpenSSL to continue using "select",
without having to change to using "depends on" dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 6cb469a..b8d106f 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	bool
+
 config BR2_PACKAGE_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_HAS_OPENSSL
