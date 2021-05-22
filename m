From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 18:59:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/llvm: include limits
In-Reply-To: <20210522151037.14378-1-fontaine.fabrice@gmail.com>
References: <20210522151037.14378-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522165936.GZ3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 17:10 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> In file included from /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.cc:15:
> /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h: In function 'void AddRange(std::vector<T>*, T, T, int)':
> /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h:17:30: error: 'numeric_limits' is not a member of 'std'
>    17 |   static const T kmax = std::numeric_limits<T>::max();
>       |                              ^~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/68581aad7c622a1fc74bb5556799e3c681425b2a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../llvm/0001-nfc-Fix-missing-include.patch   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/llvm/0001-nfc-Fix-missing-include.patch
> 
> diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm/0001-nfc-Fix-missing-include.patch
> new file mode 100644
> index 0000000000..62111ca138
> --- /dev/null
> +++ b/package/llvm/0001-nfc-Fix-missing-include.patch
> @@ -0,0 +1,24 @@
> +From b498303066a63a203d24f739b2d2e0e56dca70d1 Mon Sep 17 00:00:00 2001
> +From: serge-sans-paille <sguelton@redhat.com>
> +Date: Tue, 10 Nov 2020 14:55:25 +0100
> +Subject: [PATCH] [nfc] Fix missing include
> +
> +[Retrieved (and backported) from:
> +https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + llvm/utils/benchmark/src/benchmark_register.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/utils/benchmark/src/benchmark_register.h b/utils/benchmark/src/benchmark_register.h
> +index 0705e219f2fa2..4caa5ad4da079 100644
> +--- a/utils/benchmark/src/benchmark_register.h
> ++++ b/utils/benchmark/src/benchmark_register.h
> +@@ -1,6 +1,7 @@
> + #ifndef BENCHMARK_REGISTER_H
> + #define BENCHMARK_REGISTER_H
> + 
> ++#include <limits>
> + #include <vector>
> + 
> + #include "check.h"
> -- 
> 2.30.2
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
