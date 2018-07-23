From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 23 Jul 2018 22:06:26 +0200
Subject: [Buildroot] [PATCH 1/3] perl-net-ssh2: add missing dependency on
 zlib
In-Reply-To: <20180723200628.2256-1-thomas.de_schampheleire@nokia.com>
References: <20180723200628.2256-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180723200628.2256-2-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl-net-ssh2 requires zlib. When using the openssl backend to libssh2, this
dependency is implicit via openssl, but when using the libgcrypt backend the
dependency is missing.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/perl-net-ssh2/Config.in        | 1 +
 package/perl-net-ssh2/perl-net-ssh2.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perl-net-ssh2/Config.in b/package/perl-net-ssh2/Config.in
index 07c42ee5b1..8f359b7015 100644
--- a/package/perl-net-ssh2/Config.in
+++ b/package/perl-net-ssh2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_NET_SSH2
 	bool "perl-net-ssh2"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBSSH2
+	select BR2_PACKAGE_ZLIB
 	help
 	  Support for the SSH 2 protocol via libssh2.
 
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 6d84deb284..b174fa6210 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -9,6 +9,6 @@ PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
 PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README
-PERL_NET_SSH2_DEPENDENCIES = libssh2
+PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
 
 $(eval $(perl-package))
-- 
2.16.4
