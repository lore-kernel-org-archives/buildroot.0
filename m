From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 01:12:15 -0800
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: fix host ccache support
 for CMake 3.19
In-Reply-To: <20201212225224.117940-1-bernd.amend@gmail.com>
References: <20201212225224.117940-1-bernd.amend@gmail.com>
Message-ID: <CA+h8R2rsTFsnd9sWhQofOVgK2FS12-bgXLeHEbxWFbwO68Hd6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sat, Dec 12, 2020 at 2:57 PM Bernd Amend <bernd.amend@gmail.com> wrote:
>
> Starting with CMake 3.4 CMake supports setting a compiler launcher
> like ccache. The feature is described in
> https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_LAUNCHER.html
> This should be safe since everything is built for the host using make or ninja.
> The use of *_ARG1 is discouraged by the cmake developers
> https://cmake-developers.cmake.narkive.com/OTa9EKfj/cmake-c-compiler-arg-not-documented .
>
> Without this patch I get the following error message with CMake 3.19.1 on Arch Linux.
> Disabling BR2_CCACHE also resolves the issue.
>
> /usr/bin/cmake [~]/buildroot/build/host-lzo-2.10/ -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_FIND_ROOT_PATH="[...]" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" -DCMAKE_FIND_ROOT_P
> ATH_MODE_LIBRARY="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" -DCMAKE_INSTALL_PREFIX="[...]" -DCMAKE_C_FLAGS="-O2 -I[...]/include" -DCMAKE_CXX_FLAGS="-O2 -I[...]/include" -DCMAKE_EXE_LINKER_FLAGS="-L[...]/lib -Wl,-rpath,[...]/lib" -DCMAKE_SHARED_LINKER_FLAGS="-L[...]/l
> ib -Wl,-rpath,[...]/lib" -DCMAKE_ASM_COMPILER="/usr/bin/as" -DCMAKE_C_COMPILER="[...]/bin/ccache" -DCMAKE_CXX_COMPILER="[...]/bin/ccache"
> -DCMAKE_C_COMPILER_ARG1="/usr/bin/gcc" -DCMAKE_CXX_COMPILER_ARG1="/usr/bin/g++"  -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=O
> FF  -DENABLE_SHARED=ON -DENABLE_STATIC=OFF )
> -- The C compiler identification is unknown
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - failed
> -- Check for working C compiler: [...]/bin/ccache
> -- Check for working C compiler: [...]/bin/ccache - broken
> CMake Error at /usr/share/cmake-3.19/Modules/CMakeTestCCompiler.cmake:66 (message):
> The C compiler

Tested-by: Christian Stewart <christian@paral.in>

Fixes build errors on GitHub Actions.

Best & thanks for the fix,
Christian Stewart
