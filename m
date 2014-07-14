From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:09:27 +0200
Subject: [Buildroot] [git commit] package/perl-net-ssleay: not available for
	static link
Message-ID: <20140714111212.B0A269D1EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f89df21b89111dae7f5700d3a853d13ec779a48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Perl extensions are loaded at runtime with dlopen(), so it does not
make sense to even build extensions that are written in C.

perl-net-ssleay is (partly) written in C, so it is not available when
doing a static build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-ssleay/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index bc219b0..7cc5157 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Perl extension for using OpenSSL
 
 	  https://metacpan.org/release/Net-SSLeay
+
+comment "perl-net-ssleay needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
