From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 21:56:37 +0100
Subject: [Buildroot] [PATCH 2/2] board/qemu/x86*: use quotes around
 -append Qemu option value
In-Reply-To: <20171121080815.31347-2-thomas.petazzoni@free-electrons.com>
References: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
 <20171121080815.31347-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127205637.GJ2950@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-21 09:08 +0100, Thomas Petazzoni spake thusly:
> This helps the toolchains.free-electrons.com build logic re-use
> directly the Qemu command lines from this readme.txt file, by having a
> -append option similar to the ones used in other readme.txt files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/qemu/x86/readme.txt    | 2 +-
>  board/qemu/x86_64/readme.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
> index 17500961d3..b003ad5373 100644
> --- a/board/qemu/x86/readme.txt
> +++ b/board/qemu/x86/readme.txt
> @@ -1,6 +1,6 @@
>  Run the emulation with:
>  
> -  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
> +  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user
>  
>  Optionally add -smp N to emulate a SMP system with N CPUs.
>  
> diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
> index ecd7813a1e..ed7b5f5532 100644
> --- a/board/qemu/x86_64/readme.txt
> +++ b/board/qemu/x86_64/readme.txt
> @@ -1,6 +1,6 @@
>  Run the emulation with:
>  
> -  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
> +  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user
>  
>  Optionally add -smp N to emulate a SMP system with N CPUs.
>  
> -- 
> 2.13.6
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
