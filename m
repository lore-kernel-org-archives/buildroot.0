From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 8 Mar 2017 11:06:12 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
Message-ID: <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Wed, Mar 8, 2017 at 10:55 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Gary,
>
> On Wed, Mar 8, 2017 at 6:39 AM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>
>> I actually get a build error with this version:
>> drm-atomic.c: In function ?get_plane_id?:
>> drm-atomic.c:290:44: error: ?DRM_MODE_OBJECT_PLANE? undeclared (first
>> use in this function)
>>      drmModeObjectGetProperties(drm.fd, id, DRM_MODE_OBJECT_PLANE);
>>
>> In order to fix it I've had to add the following include to drm-atomic.c:
>> #include <libdrm/drm_mode.h>
>>
>> In case it helps, I use linaro-arm-2017-02 toolchain.
>>
>> Let me know if you don't see that issue on your end.
>
> No, I didn't see this error. Could you please send a patch to
> Buildroot and also to the upstream project?

Before sending a patch I'd like to understand why the error only shows
up in my case and not yours. I also trust that Rob built his atomic
addition before pushing it.

Can you send me the output of 'make kmscube-rebuild V=1' in your environment?

Regards,
Gary
