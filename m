From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 6 Nov 2014 22:15:37 +0100
Subject: [Buildroot] CMake building in a subdirectory
Message-ID: <CA+TH9VmvRtq9KmXKsxfWDWgUsixg9yL6SMkDEmWNWz18vxuEnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I encountered a problem making a new package based on CMake. For this
package, it's mandatory to build in a subdirectory inside src folder.
To compile it you have to do something like this:

cd src
mkdir build
cd build
cmake ..
make
make install

Honestly, it's a fairly common way to build with cmake, but it's
unsupported in buildroot. To make it work I changed this in
pkg-cmake.mk:

-$(2)_BUILDDIR                  = $$($(2)_SRCDIR)
+$(2)_BUILDDIR                  ?= $$($(2)_SRCDIR)

So, when you define LIBFOO_BUILDDIR in your .mk, cmake automatically
build in that subdirectory. This works like a charm!
Obviously, you have to mkdir that dir in LIBFOO_PRE_CONFIGURE_HOOKS.

I can submit a patch, but I would really like to know others opinions.

Sincerely, Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
