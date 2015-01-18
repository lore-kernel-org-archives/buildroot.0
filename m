From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 16:42:33 +0100
Subject: [Buildroot] [PATCH] bootlader/grub2: disable x86-64-efi choice
 on !BR2_ARCH_IS_64
In-Reply-To: <1421431115-5202-1-git-send-email-s.martin49@gmail.com>
References: <1421431115-5202-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150118154233.GM4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-01-16 18:58 +0100, Samuel Martin spake thusly:
> When x86-64-efi platform is selected, grub2 automatically adds -m64 to the
> CFLAGS. This makes the configure script failed when the toolchain does not
> have multilib support (like the Buildroot ones).
> 
> Reported-by: Noe Rubinstein <nrubinstein@aldebaran-robotics.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

I fail to see a case where we would want to build a 64-bit EFI GRUB to
later start a 32-bit kernel and userland.

Since we do not support multilib, the user would have to have two
builds: one for the 32-bit kernel+userland, one for the 64-bit
bootloader (if that is even possible to boot a 32-bit kernel from a
64-bit EFI GRUB).

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index 626344a..c465a4d 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -132,6 +132,7 @@ config BR2_TARGET_GRUB2_I386_EFI
>  
>  config BR2_TARGET_GRUB2_X86_64_EFI
>  	bool "x86-64-efi"
> +	depends on BR2_ARCH_IS_64
>  	help
>  	  Select this option if the platform you're targetting has a
>  	  64 bits EFI BIOS.
> -- 
> 2.1.0
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
