From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 15:03:24 +0200
Subject: [Buildroot] [PATCH 4/4 v3] package/perl-xml-libxml: not available
	for static link
In-Reply-To: <cover.1405256442.git.yann.morin.1998@free.fr>
References: <cover.1405256442.git.yann.morin.1998@free.fr>
Message-ID: <fbe14dfcaa71d2c2ada7dc463b80d9898191f14c.1405256442.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perl extensions are loaded at runtime with dlopen(), so it does not
make sense to even build extensions that are written in C.

perl-xml-libxml is written in C, so it is not available when doing a
static build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/perl-xml-libxml/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
index 9e3a44e..639a1e4 100644
--- a/package/perl-xml-libxml/Config.in
+++ b/package/perl-xml-libxml/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_XML_LIBXML
 	bool "perl-xml-libxml"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
@@ -8,3 +9,6 @@ config BR2_PACKAGE_PERL_XML_LIBXML
 	  Interface to Gnome libxml2 xml parsing and DOM library
 
 	  https://bitbucket.org/shlomif/perl-xml-libxml
+
+comment "perl-xml-libxml needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.9.1
