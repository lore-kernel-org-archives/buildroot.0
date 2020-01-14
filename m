From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 22:46:17 +0100
Subject: [Buildroot] [PATCH 1/2] ti-cgt-pru: bump to latest version 2.3.3
In-Reply-To: <20200114005842.45810-2-ashcharles@gmail.com>
References: <20200114005842.45810-1-ashcharles@gmail.com>
 <20200114005842.45810-2-ashcharles@gmail.com>
Message-ID: <20200114224617.5498b409@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the patch. See below for some comments.

On Mon, 13 Jan 2020 19:58:41 -0500
Ash Charles <ashcharles@gmail.com> wrote:

> Update to the latest version of the PRU code generation toolchain [1]
> 
> [1] https://release-monitoring.org/project/59398/

We need you to Signed-off-by on your patches. This is also valid for PATCH 2/2.

> ---
>  package/ti-cgt-pru/ti-cgt-pru.hash | 6 +++---
>  package/ti-cgt-pru/ti-cgt-pru.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
> index 1975d8d1e6..4dee321838 100644
> --- a/package/ti-cgt-pru/ti-cgt-pru.hash
> +++ b/package/ti-cgt-pru/ti-cgt-pru.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256	7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377	ti_cgt_pru_2.2.1_linux_installer_x86.bin
> -sha256	eb646f4f8b14351110992b40ba24d12803bcc150a76e7298705f51088b0a09cc	PRU_Code_Generation_Tools_2.2.x_manifest.html
> -sha256	6b98f9262abd1ae9a3731e6feee02a56b6e290542dea119eeeeaf88bf802aabc	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
> +sha256	1f1405167214f2c0ef848591b17a7799fdcd9f55f11bc90db9ace3490d426215	ti_cgt_pru_2.3.3_linux_installer_x86.bin
> +sha256	913cb4ab564f874b7c9a11726a16c4ccdc7ecc60be2738201281a1e28dc93641	PRU_Code_Generation_Tools_2.3.x_manifest.html
> +sha256	5e198df9782c63cedc8363f0e298b241a9a8084398a925f6e1003dbcb60801cb	pru_rts_2_3_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx

You've changed the license files hashes. What changed in those files?
What are the differences? Does it affect the value of
TI_CGT_PRU_LICENSE_FILES ?

> diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
> index 3665d2cec8..f381111c86 100644
> --- a/package/ti-cgt-pru/ti-cgt-pru.mk
> +++ b/package/ti-cgt-pru/ti-cgt-pru.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -TI_CGT_PRU_VERSION = 2.2.1
> +TI_CGT_PRU_VERSION = 2.3.3
>  TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
>  TI_CGT_PRU_SITE = http://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
>  TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
>  	BSL-1.0 (compiler), BSD-2-Clause, BSD-3-Clause, MIT, AFL-3.0, Hewlett-Packard (PRU library)
> -TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.2.x_manifest.html \
> +TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.3.x_manifest.html \
>  	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx

You did not test "make legal-info", because this last file in
TI_CGT_PRU_LICENSE_FILES doesn't exist anymore, so "make legal-info" in
a configuration that has host-ti-cgt-pru enabled fails.

Could you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
