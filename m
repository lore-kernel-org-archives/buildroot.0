From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 11:14:13 +0200
Subject: [Buildroot] [PATCH] grub2: Specify boot partition
In-Reply-To: <1404204289-8303-1-git-send-email-jezz@sysmic.org>
References: <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
 <1404204289-8303-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140701111413.1d573f2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  1 Jul 2014 10:44:49 +0200, J?r?me Pouiller wrote:
> Since boot partition was not specified, grub tools try to detect it
> automatically. This patch add an option to force it.
> 
> Notice I am not sure -p option is usefull when -c option is used.

This should not be part of the commit log. If you want to express such
comments, they should go...

> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---

... here.

Indeed, when the configuration is built into the image, I don't think
the prefix is very useful. But I believe that's OK.

> +config BR2_TARGET_GRUB2_BOOT_PARTITION
> +	string "boot partition"
> +	default "(hd0,msdos1)"

	depends on BR2_TARGET_GRUB2_I386_PC

since there is no need to specify a boot partition for the EFI boot
cases.

> +	  Specifiy partition where /boot/grub/grub.cfg will be located.

Fix that with:

	Specify the partition where the /boot/grub/grub.cfg is located.
	Use (hd0,msdos1) for the first partition of the first disk if
	using a legacy partition table, or (hd0,gpt1) if using GPT
	partition table.

Other than that, looks OK. Can you quickly resend a v2 ?

Thanks a lot for looking into this problem!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
