From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 01 Aug 2007 21:40:50 +0200
Subject: [Buildroot] Introduce "depends on" in packages requiring working
	C++ compiler
Message-ID: <1185997250.10521.5.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had set the BR2_GCC_CROSS_CXX in .config for AVR32.
BR2_INSTALL_LIBSTDCPP was not set.

I did not get a C++ compiler and the "avahi" build crashed
due to this.

I then set BR2_INSTALL_LIBSTDCPP and retried make,
but no C++ compiler was made, so the dependencies
are not working OK.


I think that packages like "avahi", requiring a C++ 
compiler should have that in their dependencies.

I am not sure about the difference between 
BR2_GCC_CROSS_CXX and BR2_INSTALL_LIBSTDCPP.

Anyone care to elaborate?

Would the following dependency work for packages like "avahi"?



Index: package/avahi/Config.in
===================================================================
--- package/avahi/Config.in     (revision 19391)
+++ package/avahi/Config.in     (arbetskopia)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AVAHI
        bool "avahi"
        select BR2_PACKAGE_LIBDAEMON
+       depends on (BR2_GCC_CROSS_CXX && BR2_INSTALL_LIBSTDCPP) ||
BR2_TOOLCHAIN_EXTERNAL
        default n
        help
          Avahi is a system which facilitates service





Best Regards
Ulf Samuelsson
