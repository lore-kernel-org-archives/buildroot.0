From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 24 Mar 2018 19:25:19 +0100
Subject: [Buildroot] [PATCH] qemu: bump to 2.11.1
In-Reply-To: <20180313094457.594-1-aduskett@gmail.com>
References: <20180313094457.594-1-aduskett@gmail.com>
Message-ID: <a27ba48e-c9be-1213-3106-2d2b8a3d5bb7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Le 13/03/2018 ? 10:44, Adam Duskett a ?crit?:
> Also refresh patch.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Qemu doesn't build with --with-system-pixman option:

ERROR: unknown option --with-system-pixman

--with-system-pixman has been removed with 2.11 version

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=35c4e86cf3c57fc395891c2bb7573c435ae58ec8

Best regards,
Romain

> ---
>  ...-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch | 10 ++++++----
>  package/qemu/qemu.hash                                         |  2 +-
>  package/qemu/qemu.mk                                           |  2 +-
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> index 6d6d024d9d..98783a38ee 100644
> --- a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> +++ b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> @@ -13,15 +13,17 @@ general case of using uc_mcontext.arm_pc, which works fine with
>  uClibc.
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +[aduskett at gmail.com: Update for 2.11.1]
>  ---
>   user-exec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
> -diff --git a/user-exec.c b/user-exec.c
> +diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>  index 6db0758..2b3d116 100644
> ---- a/user-exec.c
> -+++ b/user-exec.c
> -@@ -409,7 +409,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
> +--- a/accel/tcg/user-exec.c
> ++++ b/accel/tcg/user-exec.c
> +@@ -456,7 +456,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>   
>   #if defined(__NetBSD__)
>       pc = uc->uc_mcontext.__gregs[_REG_R15];
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 1173c1bf3d..dd1ac9a179 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256 fcfdaa1ecdaac8aead616fe811bfb8fe4a8f2cd59796aa446c5175b5af0e829f  qemu-2.10.2.tar.xz
> +sha256 8a5145d1f8bd2eadc6776f3e13c68cd28d01349e30639bdbcb26ac588d668686  qemu-2.11.1.tar.xz
>  sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
>  sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 345ef52668..7762ad73e2 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QEMU_VERSION = 2.10.2
> +QEMU_VERSION = 2.11.1
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = http://download.qemu.org
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
> 
