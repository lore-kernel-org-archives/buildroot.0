From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Jul 2014 20:01:38 +0200
Subject: [Buildroot] How to control kernel header version?
In-Reply-To: <CAHvj1qaaXv6dGD6do7oED=uNKMpwZMFwOOdyjhGHC0J8KxykiA@mail.gmail.com>
References: <CAHvj1qaaXv6dGD6do7oED=uNKMpwZMFwOOdyjhGHC0J8KxykiA@mail.gmail.com>
Message-ID: <53B2F782.7010900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/06/14 12:37, bruce bushby wrote:
> Hi
> 
> I wanted to ask how I can control kernel header version? I've tried various
> configs but so far I can't prevent buildroot using the latest "stable" version
> of kernel headers.
> 
> 
> My kernel config is:
> 
> # Kernel headers
> #BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
> 
> # Kernel
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_VERSION="master"
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/torvalds/linux.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3493860c76eb4e5b222f1016d1458615afac9fc4"
> BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
> BR2_LINUX_KERNEL_APPENDED_UIMAGE=n
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_APPENDED_DTB=n
> BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-pcduino3.dts"
> 
> 
> I think the current master is 3.16.0-rc3 .... but I keep seeing buildroot
> downloading linux-headers-3.15.1 (current stable)

 For this particular case, you should be able to set

BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.16-rc3"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y


 Regards,
 Arnout

> 
> Is there a way to force using the headers from the the same source as
> "KERNEL_CUSTOM_REPO" ?
> 
> 
> 
> Thanks
> Bruce
> 
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
