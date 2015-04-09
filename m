From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 09 Apr 2015 18:03:17 +0200
Subject: [Buildroot] [PATCH v6 00/15] Add Xorg support for iMX6
In-Reply-To: <CADCpmyOp078FVzrQqR8xehha56O4Db3roVKPQL2Zj97NwFJoUQ@mail.gmail.com>
References: <1421451251-23366-1-git-send-email-jezz@sysmic.org>
 <CADCpmyOp078FVzrQqR8xehha56O4Db3roVKPQL2Zj97NwFJoUQ@mail.gmail.com>
Message-ID: <5526A2C5.3000502@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On 01/22/2015 07:47 AM, Gary Bisson wrote:
> Hi Jerome,
>
> On Fri, Jan 16, 2015 at 3:33 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
>> Hello,
>>
>> Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
>> Xorg. This work is mainly adapted from Yocto.
>>
>> v6:
>>    - Rebase on master
>>    - Add license for xdriver_xf86-video-imx-viv. Notice this package does not
>>      provide any license file.
>>    - Fix typos suggested by Thomas P.
>>    - Fix dependency on libdrm (gpu-viv-bin-mx6q does not depends on libdrm, but
>>      xdriver_xf86-video-imx-viv does depend)
>>    - Add a note about runtime dependencies in gpu-viv-bin-mx6q
>>    - Splited patch 6/15 in 3 parts
>>    - Splited patch 10/15 in 2 parts
>>    - Make 0001-Force_egl_visual_ID_33.patch contionnal
>>
>
> I confirm this patchset applies and builds fine on master. However I
> couldn't get X to start properly as it was complaining that no screen
> was available (using the  same setup as before: nitrogen6x + HDMI
> monitor). I didn't have time to investigate any further but have you
> had any issue? I think the X server version has been bumped lately,
> are you still using the same xorg.conf?
> I'll try to get more info before the end of the week.

I guess you must feel desperate about this patchset getting into 
mainline and I'm sorry not to have looked at it for months.
Anyway, I got some time today and built everything from scratch again 
using the configuration you suggest in you 7/15 but for my board 
(nitrogen6x kernel and u-boot config).
First of all, everything applies and builds fine on today's master. Then 
everything I've tested is working fine:
- X (starting the X server with the xorg.conf from Yocto):
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
- GPU libs with X back-end (test of turorial7). Plus I made sure 
building with fb back-end still works fine
- Qt5 with openGl, as I didn't what was the best test I've started a few 
binaries:
# /usr/lib/qt/examples/opengl/hellogl2/hellogl2
# /usr/lib/qt/examples/gui/openglwindow/openglwindow
# qmlscene TestCase.qml

In other words, everything runs great!

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
