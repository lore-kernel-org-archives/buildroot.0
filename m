From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 23:06:16 +0000
Subject: [Buildroot] [PATCH] Add Armadeus systems APF9328 support.
In-Reply-To: <87sjlls36c.fsf@macbook.be.48ers.dk>
References: <1321525301-13110-1-git-send-email-julien.boibessot@free.fr>
 <4EC690A5.301@free.fr> <87sjlls36c.fsf@macbook.be.48ers.dk>
Message-ID: <201111182306.16803.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 November 2011 18:20:27 Peter Korsgaard wrote:
> >>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:
> 
> Hi,
> 
>  >> Since two kernel patches are needed, you should have a defconfig that
>  >> explicitly tells which kernel version it wants:
>  >> 
>  >> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  >> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
> 
>  Julien> ok but if I set BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1.1",
>  Julien> it is not saved by "make savedefconfig". Seems like there is a
>  Julien> "bug" in BR when custom kernel version == default one
> 
> Well, it's how savedefconfig behaves in the kernel. Just edit the file
> manually afterwards - That way it will still work when we change the
> default kernel version to be 3.2.

 In fact, that default for the custom kernel version is redundant.  We
already have a default kernel version, there's no point in having it twice.

 Patch follows.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
