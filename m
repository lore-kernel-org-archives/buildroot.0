From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Feb 2020 15:59:51 +0100
Subject: [Buildroot] [PATCH v2] package/ninja: fix build for cmake 3.10
In-Reply-To: <20200206132132.23734-1-yegorslists@googlemail.com>
 (yegorslists's message of "Thu, 6 Feb 2020 14:21:32 +0100")
References: <20200206132132.23734-1-yegorslists@googlemail.com>
Message-ID: <87k14ywihk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > If the host cmake is 3.10, the configuration step produces
 > the following error:

 > CMake Error at CMakeLists.txt:87 (target_link_libraries):
 > Target "libninja" of type OBJECT_LIBRARY may not be linked into another
 > target. One may link only to STATIC or SHARED libraries, or to executables
 > with the ENABLE_EXPORTS property set.

 > This patch fixes CMakeLists.txt to use the object library as it was intended
 > in cmake 3.10.

 > Fixes:
 > https://bugs.busybox.net/show_bug.cgi?id=12546

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > Tested-by: Damian Tometzki <dti@familie-tometzki.de>
 > ---
 > Changes v1 -> v2:
 >     - add Tested-by tag from Damian
 >     - mention bug report

Please use the -N option when generating patches from git (here and the
libftdi1 patch) - check-package complains:

Applying: package/ninja: fix build for cmake 3.10
package/ninja/0003-CMake-fix-object-library-usage.patch:4: generate your patches with 'git format-patch -N'

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
