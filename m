From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Nov 2019 09:51:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/zxing-cpp: fix build with
 cppunit and gcc 5
In-Reply-To: <20191109083710.10660-2-fontaine.fabrice@gmail.com>
References: <20191109083710.10660-1-fontaine.fabrice@gmail.com>
 <20191109083710.10660-2-fontaine.fabrice@gmail.com>
Message-ID: <20191109085101.GN3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-09 09:37 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/8c675300aa7e7f2a5a2f0a2ac0f191b8d2ff8c42

This should be folded in the previous patch, as this is mostly the same
thing: adding the optional dependency on cppunit and fixing the build
with cppunit.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[--SNIP--]
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ccb2ba9..738f4e1 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -34,6 +34,8 @@ include(source_files.cmake)
> +     add_definitions(-D_CRT_SECURE_NO_WARNINGS)
> +     add_definitions(/Za)
> + endif()
> ++
> ++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

This hints that maybe a dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 is
now needed, no?

Regards,
Yann E. MORIN.

> + # Add libzxing library.
> + file(GLOB_RECURSE LIBZXING_FILES
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
