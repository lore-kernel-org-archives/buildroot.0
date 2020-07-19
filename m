From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 22:55:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/avro-c: fix build without C++
In-Reply-To: <20200719082744.1708332-1-fontaine.fabrice@gmail.com>
References: <20200719082744.1708332-1-fontaine.fabrice@gmail.com>
Message-ID: <20200719205516.GA18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-19 10:27 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/cfa91db53cf5502cbb6f902d1e7ad6397c8d70fd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...d-failure-without-a-C-compiler-again.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
> 
> diff --git a/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch b/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
> new file mode 100644
> index 0000000000..8f7e59cf62
> --- /dev/null
> +++ b/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
> @@ -0,0 +1,34 @@
> +From 8f5633a29b083a84876c00b88fba6d3e8dbbf1a8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 19 Jul 2020 09:35:09 +0200
> +Subject: [PATCH] cmake: Build failure without a C++ compiler (again)
> +
> +avro-c fails to build (again) without a C++ compiler because commit
> +664c2fc7fba19709c1f974055f9cf4c8a799e108 reverted the change made by
> +commit 414a51fdc1856083bb16851f09a4c61a48796132
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/cfa91db53cf5502cbb6f902d1e7ad6397c8d70fd
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://issues.apache.org/jira/browse/AVRO-2898]
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 6c8d7aaf..aa923e18 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -17,7 +17,7 @@
> + # under the License.
> + #
> + cmake_minimum_required(VERSION 3.1)
> +-project(AvroC)
> ++project(AvroC C)
> + enable_testing()
> + 
> + set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
> +-- 
> +2.27.0
> +
> -- 
> 2.27.0
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
