From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 3 Aug 2016 14:57:41 +0200
Subject: [Buildroot] the problem with Xorg, QT5 and imx vivant dirver
In-Reply-To: <20160803115341.21a3018b@free-electrons.com>
References: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
 <20160802213044.264e63f8@free-electrons.com>
 <CAMWiJUs2371W5JZGnDuAozTCKUHKQtoU+V1hrb1rHKsh=nG6DA@mail.gmail.com>
 <20160803115341.21a3018b@free-electrons.com>
Message-ID: <CAAMH-yvnsS7vq=XS_E0iLaRV-XZi2aQkHSKujn5FuZ5kK5=dug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Aug 3, 2016 at 11:53 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> <snip>
>> But I changed the option to this:
>> Xorg X Window Sytem -> X11R7 Drivers -> x86-video-imx-viv (with Mesa3D
>> selected automatic)
>> Freescale imx libraries -> imx-gpu-viv -> output option -> X11
>> QT5 -> OpenGL API -> OpenGL ES 2.0 +
>> QT5 -> Xorg XCB support
>> QT5-> eglfs support
>>
>> With this option, I have the problem with QT Widget during the building.
>>
>> I attache the config file and the infomations about build.
>
> I'll fire up a build and see what happens. Gary, do you have an idea?

Yes I confirm it is not working. It has been reported by Antoine
T?nart in the past, see this thread:
http://lists.busybox.net/pipermail/buildroot/2016-March/154974.html

At the end of the thread, two solutions were offered, none has been chosen yet.

But as a summary, even if fixing the eglfs build can be done, at
runtime you wouldn't be able to use it while X11 is running. Is this
really what you want to do?

In Yocto, my understanding is that they force the '-no-eglfs'
configuration when X11 is enabled:
https://github.com/Freescale/meta-fsl-arm/blob/master/qt5-layer/recipes-qt/qt5/qtbase_%25.bbappend#L12

Regards,
Gary
