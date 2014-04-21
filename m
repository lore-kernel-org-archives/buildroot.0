From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Apr 2014 12:04:19 -0300
Subject: [Buildroot] [PATCH 6/6] update to 3.14
In-Reply-To: <1397382423-4939-7-git-send-email-wbx@openadk.org>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-7-git-send-email-wbx@openadk.org>
Message-ID: <53553373.70904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/2014 06:47 AM, Waldemar Brodkorb wrote:

> * fix networking in Qemu using a small patch
> * disable DTS, because linux.bin does not include any DTB the
>   default Qemu included DTB is used and this is okay and works fine
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
(on Qemu)

Some detail nitpicking below:

> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=n

It's the default so you can just delete it.

> +BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"

Should use a separate copy of the patch for BE in the BE dir even if
it's the same.

> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index 3a66d1b..6a59707 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=n

Ditto above.
Thanks.
