From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 09:35:25 +0100
Subject: [Buildroot] [PATCH 11/15] grub2: add new package
In-Reply-To: <87r49wtcei.fsf@dell.be.48ers.dk>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1384188459-1332-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <87r49wtcei.fsf@dell.be.48ers.dk>
Message-ID: <20131202093525.65fe5a84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 01 Dec 2013 23:49:25 +0100, Peter Korsgaard wrote:

>  > diff --git a/boot/Config.in b/boot/Config.in
>  > index eb5f7cd..71d2fbd 100644
>  > --- a/boot/Config.in
>  > +++ b/boot/Config.in
>  > @@ -6,6 +6,7 @@ source "boot/at91dataflashboot/Config.in"
>  >  source "boot/barebox/Config.in"
>  >  source "boot/boot-wrapper-aarch64/Config.in"
>  >  source "boot/grub/Config.in"
>  > +source "boot/grub2/Config.in"
>  >  source "boot/lpc32xxcdl/Config.in"
>  >  source "boot/mxs-bootlets/Config.in"
>  >  source "boot/syslinux/Config.in"
>  > diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
>  > new file mode 100644
>  > index 0000000..e59626a
>  > --- /dev/null
>  > +++ b/boot/grub2/Config.in
>  > @@ -0,0 +1,120 @@
>  > +config BR2_TARGET_GRUB2
>  > +	bool "grub2"
>  > +	depends on BR2_i386 || BR2_x86_64
> 
> Doesn't grub2 also need BR2_HOSTARCH_NEEDS_IA32_COMPILER?

From what I've tested, no it doesn't. I believe this is because grub
legacy needed libgcc, while grub2 doesn't need libgcc, so you don't
need a multilib compiler: a non-multilib x86-64 gcc can generate 32 bits
code, but doesn't provide a 32 bits libgcc.

I can do another testing if needed, just to validate this once more
(it's been a while since I did this, and I may have overlooked
something).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
