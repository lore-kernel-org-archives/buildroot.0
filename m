From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 12:26:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with riscv32
In-Reply-To: <20210403152930.2221759-1-fontaine.fabrice@gmail.com>
References: <20210403152930.2221759-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404102613.GG2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-03 17:29 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b

Technically, this is not a bug fix, but support for a new architecture,
akin to a new feature. But since this is an upstream commit, this is OK
to backport, as we can drop the patch when we next update the version.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../botan/0003-Add-support-for-riscv32.patch  | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/botan/0003-Add-support-for-riscv32.patch
> 
> diff --git a/package/botan/0003-Add-support-for-riscv32.patch b/package/botan/0003-Add-support-for-riscv32.patch
> new file mode 100644
> index 0000000000..d8978b2f11
> --- /dev/null
> +++ b/package/botan/0003-Add-support-for-riscv32.patch
> @@ -0,0 +1,31 @@
> +From 443bf46ee2b1b1d7acd63e3f00dcbe66646138f8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 2 Apr 2021 20:37:03 +0200
> +Subject: [PATCH] Add support for riscv32
> +
> +Fix the following build failure:
> +
> +  ERROR: Unknown or unidentifiable processor "riscv32"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/randombit/botan/commit/aa7958880bee2091a8a71bf9e1f6e6efb34581e3]
> +---
> + src/build-data/arch/riscv32.txt | 2 ++
> + 1 file changed, 2 insertions(+)
> + create mode 100644 src/build-data/arch/riscv32.txt
> +
> +diff --git a/src/build-data/arch/riscv32.txt b/src/build-data/arch/riscv32.txt
> +new file mode 100644
> +index 000000000..ba88b42e9
> +--- /dev/null
> ++++ b/src/build-data/arch/riscv32.txt
> +@@ -0,0 +1,2 @@
> ++family riscv32
> ++endian little
> +-- 
> +2.30.2
> +
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
