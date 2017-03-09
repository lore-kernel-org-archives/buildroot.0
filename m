From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 9 Mar 2017 15:53:37 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAOMZO5BxKvub7SRbiwdDFc0W6Kxr=V8nj7uA=WYUc_iAGAQpNw@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
 <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
 <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
 <CAAMH-ys1J+wuKrEQ7dN=YbcbgTB+kjK0SJJV4Cvj2X9G0yf1pQ@mail.gmail.com>
 <CAOMZO5BxKvub7SRbiwdDFc0W6Kxr=V8nj7uA=WYUc_iAGAQpNw@mail.gmail.com>
Message-ID: <CAAMH-ythsVpak9K2JqXG5qR3gXNOgWQ60vXxMwvRKPksbrVOnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Wed, Mar 8, 2017 at 4:47 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Gary,
>
> On Wed, Mar 8, 2017 at 12:17 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>
>> Can you tell me where is DRM_MODE_OBJECT_PLANE defined in your case?
>>
>> Here is my output:
>> $ grep -rn DRM_MODE_OBJECT_PLANE output/host/usr/arm-buildroot-linux-gnueabihf/
>> output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm/drm_mode.h:336:#define
>> DRM_MODE_OBJECT_PLANE 0xeeeeeeee
>
> I see them defined in two places here:
>
> $ grep -rn DRM_MODE_OBJECT_PLANE output/host/
> output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/drm/drm_mode.h:336:#define
> DRM_MODE_OBJECT_PLANE 0xeeeeeeee
> output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/libdrm/drm_mode.h:336:#define
> DRM_MODE_OBJECT_PLANE 0xeeeeeeee

So it means your toolchain is using kernel headers >= 4.7.
http://lxr.free-electrons.com/ident?v=4.6;i=DRM_MODE_OBJECT_PLANE
http://lxr.free-electrons.com/ident?v=4.7;i=DRM_MODE_OBJECT_PLANE

Not sure which header version the Linaro toolchain is using but it's
definitely older than 4.7.

From the manifest we know the toolchain is build on a machine running
a 4.4.x kernel:
https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/gcc-linaro-6.3.1-2017.02-linux-manifest.txt

>> Also, is adding my fix to your build bringing any issue?
>
> Just tried your patch and the build still succeeds with it.

Thanks for testing it out, good to here it works but I'm still not
sure adding this libdrm/drm_mode.h is the best solution as-is.

Thomas, do you have any advice on what's the best approach here.

Regards,
Gary
