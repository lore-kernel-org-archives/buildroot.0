From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 02:59:43 +0200
Subject: [Buildroot] [PATCH 12/12] fs/iso9660: add support for grub2
In-Reply-To: <20150605230756.GM3641@free.fr>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605230756.GM3641@free.fr>
Message-ID: <20150606025943.4395bdb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 6 Jun 2015 01:07:56 +0200, Yann E. MORIN wrote:

> > -comment "iso image needs a Linux kernel and grub or isolinux to be built"
> > +comment "iso image needs a Linux kernel and grub(2) or isolinux to be built"
> 
> I ghave to admit that reading this comment using the usual associativity
> of 'and' and 'or' makes it sound that we either want
>   - a kernel and grub/grub2,
>   - or isolinux

True. Any suggestion to improve that?

comment "iso image needs (a Linux kernel && (grub(2) || isolinux))"

is probably a bit hard to read, no ? :-)

> > +menuentry "Buildroot" {
> > +	linux __KERNEL_PATH__ root=/dev/sr0 console=tty1
> 
> Why do you forcibly pass the console setting?

That's a good question. We don't have that for the grub and isolinux
case, so I'm not sure why I added that for the grub2 case. I'll kill
that and retest. Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
