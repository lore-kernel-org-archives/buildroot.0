From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 01:07:56 +0200
Subject: [Buildroot] [PATCH 12/12] fs/iso9660: add support for grub2
In-Reply-To: <1433430330-2166-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150605230756.GM3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-04 17:05 +0200, Thomas Petazzoni spake thusly:
> After having extended the iso9660 support to allow isolinux as an
> alternative to grub, this commit adds grub2 as a third
> alternative. With the previous work done to support isolinux, adding
> support for grub2 is fairly trivial.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> -comment "iso image needs a Linux kernel and grub or isolinux to be built"
> +comment "iso image needs a Linux kernel and grub(2) or isolinux to be built"

I ghave to admit that reading this comment using the usual associativity
of 'and' and 'or' makes it sound that we either want
  - a kernel and grub/grub2,
  - or isolinux

/me should sometime go back to the real world! :-]

> diff --git a/fs/iso9660/grub.cfg b/fs/iso9660/grub.cfg
> new file mode 100644
> index 0000000..b8329c3
> --- /dev/null
> +++ b/fs/iso9660/grub.cfg
> @@ -0,0 +1,7 @@
> +set default="0"
> +set timeout="5"
> +
> +menuentry "Buildroot" {
> +	linux __KERNEL_PATH__ root=/dev/sr0 console=tty1

Why do you forcibly pass the console setting?

> +	initrd __INITRD_PATH__
> +}

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
