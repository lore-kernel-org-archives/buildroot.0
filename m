From: Jeff Horn <outforaride@gmail.com>
Date: Mon, 10 Nov 2014 16:04:14 -0800
Subject: [Buildroot] host ldconfig package
In-Reply-To: <CADCpmyNMs7yTdGEzurOEvpHHSPJsDVHCEv6+dMT3s1ez9tR2Pg@mail.gmail.com>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
 <1456757.71s6JAxXJf@aquila>
 <CAM7q1LnW3-XFTqh-yWBZTb9O6XEy_CKxtjZhq62GYPmrd-a-PA@mail.gmail.com>
 <CADCpmyNMs7yTdGEzurOEvpHHSPJsDVHCEv6+dMT3s1ez9tR2Pg@mail.gmail.com>
Message-ID: <CAM7q1LmUEctUgvix+28NX=qeHfPVYM_XC4WFyo_=LA3uVOieqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All

On Sat, Nov 8, 2014 at 1:56 PM, Gary Bisson <bisson.gary@gmail.com> wrote:
> Jeff, Jerome, All,
>
> Jeff, could you confirm everything works fine once the library paths have
> been added to ld.so.conf?

I managed to get Qt5 video playback working! However, the only way I
could make it work was to run my hacked version of ldconfig and I had
to edit the /usr/share/*.cf as the path referenced my host build
sysroot and not the target sysroot. With those two modifications the
Qt5 Qml video element works fine. In addition, Qt 5.3 appears to take
advantage of hardware acceleration.

Note that adding /usr/lib/imx-mm to ld.so.conf alone did not resolve
the missing plugin issue. I'm not sure what I am missing or doing
wrong. I might try and modify the gst-fsl-plugins.mk file to move the
libs from /usr/lib/imx-mm to /usr/lib and that will eliminate a need
for both ldconfig and ld.so.conf.

I'll keep working on this but things look promising. I'm very new to
buildroot so I'll double check that I am not missing something in the
build.

Thanks,
Jeff

>
> Let me know if I can be of any help either writing the fix or testing it.
>
> Thanks,
> Gary
