From: Darius Augulis <augulis.darius@gmail.com>
Date: Mon, 29 Aug 2011 20:22:54 +0300
Subject: [Buildroot] [PATCH 14/28] grub: convert to AUTOTARGETS
In-Reply-To: <87aaawqt32.fsf@macbook.be.48ers.dk>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>	<20a318776db62b41f3bb365d2417e6251fc2d8ea.1309895466.git.thomas.petazzoni@free-electrons.com>	<4E4F7CCD.8030407@gmail.com>
 <87aaawqt32.fsf@macbook.be.48ers.dk>
Message-ID: <4E5BCAEE.9030302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi,

it's not necessary with my grub patches "grub: build for host" and 
"grub: fix ext2 segfaults".
Please find these on mailing list and review if you can.
Grub binary is useful on host system when cross compiling for x86 to 
install bootloader into CF, for example.

BR,
Darius


On 08/26/2011 03:02 PM, Peter Korsgaard wrote:
>>>>>> "Darius" == Darius Augulis<augulis.darius@gmail.com>  writes:
>   Darius>  Hi Thomas,
>
>   Darius>  with these changes grub is not installed to staging dir.
>   Darius>  grub.mk has label:
>
>   Darius>  define GRUB_INSTALL_STAGING_CMDS
>   Darius>          install -m 0755 -D $(@D)/grub/grub $(STAGING_DIR)/sbin/grub
>   Darius>  endef
>
>   Darius>  but when building it's installed only to target dir, but not to
>   Darius>  staging.
>
> Ahh yes. What is the use case for installing grub into staging? Does it
> make any sense to do so?
>
