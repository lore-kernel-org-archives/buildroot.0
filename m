From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:49:18 +0200
Subject: [Buildroot] [git commit] gcc: deprecate objective C and fortran
	support
Message-ID: <20130919195156.B123F9B7D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bbc83c6e778827307436e0feb9fd829ae562f1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the list. They have been broken for a long time, and are
not commonly used in embedded systems.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 116fd24..32c668a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -128,6 +128,7 @@ comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
 config BR2_INSTALL_OBJC
 	bool "Enable Objective-C support"
 	depends on !BR2_avr32
+	depends on BR2_DEPRECATED
 	help
 	  Enable the support for the Objective-C language in the
 	  cross-compiler, and install the Objective-C runtime to the
@@ -136,6 +137,7 @@ config BR2_INSTALL_OBJC
 config BR2_INSTALL_FORTRAN
 	bool "Enable Fortran support"
 	depends on !BR2_avr32
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBMPFR
 	help
 	  Enable the support for the Fortran language in the
