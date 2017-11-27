From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 21:56:22 +0100
Subject: [Buildroot] [PATCH 1/2] board/qemu/ppc64-pseries: adjust Qemu
 command line
In-Reply-To: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
References: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127205622.GI2950@scaer>
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
>  board/qemu/ppc64-pseries/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
> index 7cc0c67d61..9de13779d0 100644
> --- a/board/qemu/ppc64-pseries/readme.txt
> +++ b/board/qemu/ppc64-pseries/readme.txt
> @@ -1,6 +1,6 @@
>  Run the emulation with:
>  
> - qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append 'console=hvc0 root=/dev/sda' -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
> + qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
>  
>  The login prompt will appear in the terminal that started Qemu.
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
