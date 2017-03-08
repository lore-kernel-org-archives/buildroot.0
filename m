From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Mar 2017 12:47:14 -0300
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAAMH-ys1J+wuKrEQ7dN=YbcbgTB+kjK0SJJV4Cvj2X9G0yf1pQ@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
 <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
 <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
 <CAAMH-ys1J+wuKrEQ7dN=YbcbgTB+kjK0SJJV4Cvj2X9G0yf1pQ@mail.gmail.com>
Message-ID: <CAOMZO5BxKvub7SRbiwdDFc0W6Kxr=V8nj7uA=WYUc_iAGAQpNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Mar 8, 2017 at 12:17 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Can you tell me where is DRM_MODE_OBJECT_PLANE defined in your case?
>
> Here is my output:
> $ grep -rn DRM_MODE_OBJECT_PLANE output/host/usr/arm-buildroot-linux-gnueabihf/
> output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm/drm_mode.h:336:#define
> DRM_MODE_OBJECT_PLANE 0xeeeeeeee

I see them defined in two places here:

$ grep -rn DRM_MODE_OBJECT_PLANE output/host/
output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/drm/drm_mode.h:336:#define
DRM_MODE_OBJECT_PLANE 0xeeeeeeee
output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/libdrm/drm_mode.h:336:#define
DRM_MODE_OBJECT_PLANE 0xeeeeeeee

> Also, is adding my fix to your build bringing any issue?

Just tried your patch and the build still succeeds with it.

Regards,

Fabio Estevam
