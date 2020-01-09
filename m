From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jan 2020 17:14:49 +0100
Subject: [Buildroot] [PATCH v1] package/zxing-cpp: disable testrunner
In-Reply-To: <20200109132156.30722-1-ps.report@gmx.net>
References: <20200109132156.30722-1-ps.report@gmx.net>
Message-ID: <20200109171449.1e5396ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Jan 2020 14:21:56 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> In case cppunit dependency is found the testrunner is build
> which needs c++11 compile support enabled, avoid by building
> only libzxing and zxing targets.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/f7c2c03a2b5a0147a041d873c1a36143861be764
> 
>   [ 85%] Building CXX object CMakeFiles/testrunner.dir/core/tests/src/common/BitArrayTest.cpp.o
>   In file included from .../host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/type_traits:35:0,
>                    from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/tools/StringHelper.h:7,
>                    from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/TestAssert.h:8,
>                    from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/TestCase.h:6,
>                    from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/TestCaller.h:5,
>                    from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/extensions/HelperMacros.h:9,
>                    from .../build/zxing-cpp-0db7f855135222becff193671faae79c083424b6/core/tests/src/common/BitArrayTest.h:24,
>                    from .../build/zxing-cpp-0db7f855135222becff193671faae79c083424b6/core/tests/src/common/BitArrayTest.cpp:21:
>   .../host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
