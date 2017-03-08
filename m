From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 8 Mar 2017 10:39:49 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <20170306213121.203079d8@free-electrons.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
Message-ID: <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio, All,

On Mon, Mar 6, 2017 at 9:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 6 Mar 2017 17:26:30 -0300, Fabio Estevam wrote:
>> Hi Thomas,
>>
>> On Mon, Mar 6, 2017 at 5:22 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> > Applied to master, thanks.

I actually get a build error with this version:
drm-atomic.c: In function ?get_plane_id?:
drm-atomic.c:290:44: error: ?DRM_MODE_OBJECT_PLANE? undeclared (first
use in this function)
     drmModeObjectGetProperties(drm.fd, id, DRM_MODE_OBJECT_PLANE);

In order to fix it I've had to add the following include to drm-atomic.c:
#include <libdrm/drm_mode.h>

In case it helps, I use linaro-arm-2017-02 toolchain.

Let me know if you don't see that issue on your end.

Regards,
Gary
