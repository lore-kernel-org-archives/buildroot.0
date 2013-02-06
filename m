From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 06 Feb 2013 17:52:00 -0300
Subject: [Buildroot] [PATCH] configs/{ea3250, fdi3250,
 phy3250}: lock down kernel headers version
In-Reply-To: <5112C01E.2090807@mind.be>
References: <1360182113-23743-1-git-send-email-gustavo@zacarias.com.ar>
 <5112C01E.2090807@mind.be>
Message-ID: <5112C270.90503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2013 05:42 PM, Arnout Vandecappelle wrote:
>  This should really be done for all defconfigs that build a custom
> kernel version:
> 
> arm_foundationv8_defconfig
> armadeus_apf9328_defconfig
> at91sam9g20dfc_defconfig
> atstk100x_defconfig
> beaglebone_defconfig
> calao_snowball_defconfig
> kb9202_defconfig
> mini2440_defconfig
> mx53loco_defconfig
> sheevaplug_defconfig
> 
>  And the ones that allow it should probably set
> BR2_LINUX_KERNEL_SAME_AS_HEADERS.
> 
>  But all that is a lot of testing :-)

Yes, i'm sending as i'm testing :)
I'll also be switching these ones (*3250*) configs to git tags/releases
!= master because there's a filename clash possibility there.
Not at the moment though since those use the same upstream and no other
BSP config does that, but it could happen.

>  Only BR2_DEFAULT_KERNEL_VERSION is necessary -
> BR2_DEFAULT_KERNEL_HEADERS is derived from it by Kconfig.

Cool, i'll minimize them then.
Regards.
