From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:09:43 +0200
Subject: [Buildroot] [git commit] package/perl-xml-libxml: not available for
	static link
Message-ID: <20140714111212.BA3F79CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d6dc9806852c53e3e0d87169cd9e9c771a1d73a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Perl extensions are loaded at runtime with dlopen(), so it does not
make sense to even build extensions that are written in C.

perl-xml-libxml is written in C, so it is not available when doing a
static build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-libxml/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
