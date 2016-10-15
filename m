From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 15:16:16 +0200
Subject: [Buildroot] lego ev3 defconfig
In-Reply-To: <874m4dizaz.fsf@dell.be.48ers.dk>
References: <874m4dizaz.fsf@dell.be.48ers.dk>
Message-ID: <d7af770a-9e6e-abfc-d034-1bb301c716e5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 14:15, Peter Korsgaard wrote:
> Hi Vincent,
> 
> You added the lego_ev3_defconfig 2 years ago. Do you still have an ev3?
> 
> The defconfig is using gcc 4.7 with a note that the kernel doesn't boot
> with 4.8 - But gcc 4.7 is deprecated and we are about to remove it, so
> that isn't really good.
> 
> I see that there's a number of newer kernel version available on
> 
> https://github.com/ev3dev/ev3-kernel/releases
> 
> Could you perhaps test if one of these work with our default gcc (5.x)?
> Thanks.

 I've started on a defconfig but I didn't get around to finish it, and of course
I can't test it. Here it is:

# architecture
BR2_arm=y
BR2_arm926t=y

# system
BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"

# Linux headers same as kernel, a 4.4 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

# Kernel
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
# v4.4.19-15-ev3dev-ev3_1
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/ev3dev/ev3-kernel/archive/5bae80fb82b77919712e16970dd4d04725e69eaa.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"

# filesystem
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_3=y
# BR2_TARGET_ROOTFS_TAR is not set



 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
