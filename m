From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2019 23:04:04 +0200
Subject: [Buildroot] [PATCH v3] boot/riscv-pk: Remove obselete bootloader
In-Reply-To: <20191008163219.13477-1-alistair.francis@wdc.com>
References: <20191008163219.13477-1-alistair.francis@wdc.com>
Message-ID: <cc2545c6-f446-596c-1328-a9d749b7f88b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/10/2019 18:32, Alistair Francis wrote:
> The RISCV Proxy Kernel (AKA BBL) isn't being used by most distros so has
> very limited testing. It has been replaced by OpenSBI and been
> deprecated for awhile, so let's just remove it.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

 Since Mark gave the go in the end, I applied to master, thanks.

> ---
> v3:
>  - Fix indentation in Config.in.legacy
>  - Rebase on master
> 
> v2:
>  - Remove package from DEVELOPERS
>  - Add option to Config.in.legacy
> 
>  Config.in.legacy          |  7 +++++++
>  DEVELOPERS                |  1 -
>  boot/Config.in            |  1 -
>  boot/riscv-pk/Config.in   | 17 -----------------
>  boot/riscv-pk/riscv-pk.mk | 32 --------------------------------
>  5 files changed, 7 insertions(+), 51 deletions(-)
>  delete mode 100644 boot/riscv-pk/Config.in
>  delete mode 100644 boot/riscv-pk/riscv-pk.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4a670f0f0e..f97872258e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2019.11"
>  
> +config BR2_TARGET_RISCV_PK
> +	bool "riscv-pk was removed"
> +	select BR2_LEGACY
> +	help
> +	  The RISC-V Proxy Kernel (pk) and Berkley Boot Loader (BBL) have

 This line was too long, as reported by check-package.

> +	  been replaced with OpenSBI.

 Normally, for legacy symbols, we automatically select the replacement. So in
this case, we could add 'select BR2_TARGET_OPENSBI' here. However, since the
target platform still has to be specified, doing it automatically doesn't make a
whole lot of sense.


 Regards,
 Arnout

[snip]
