From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Aug 2020 15:05:49 -0700
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64 build
In-Reply-To: <20200819214204.GX24264@scaer>
References: <20200818191130.2888592-1-christian@paral.in>
 <20200818193338.GP24264@scaer>
 <CA+h8R2oRLfVOG4m9_mbg_hHhZNxggQLZt_8JBTOL8poQwaP+DQ@mail.gmail.com>
 <20200818201612.GR24264@scaer>
 <CA+h8R2rB+_t02w2YbqBR74_9iEg67EPZB4o_tGUrqSeuz7Ekjg@mail.gmail.com>
 <20200819214204.GX24264@scaer>
Message-ID: <CA+h8R2r_CZhCVdUew3hQjVnG-H0Bn44_0aG=Akz_i8Zetas7Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,


On Wed, Aug 19, 2020 at 2:42 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2020-08-19 13:54 -0700, Christian Stewart spake thusly:
> > On Tue, Aug 18, 2020 at 1:16 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Of course, not having everything is not irrelevant. However, this is
> > something we expect the rpi-userland developers to address, not the
> > Buildroot developers, correct?
>
> Right, but the package in Buildroot still declares providing libegl,
> libgels, vg, and max, which is clearly wrong in this case.
>
> With just your patch, the package would still advertise providing those,
> but they would not be built. Any pacjage that "just" needs a GL/GLES
> provider (and has ptherwise no requirement on the arcitecture) would
> fail to build.
>
> That is what was pointed out in the first review (which I already
> pointed to):
>
>     http://lists.busybox.net/pipermail/buildroot/2020-January/271588.html
>
> ... which already had a proposal patch to fix the provider side of the
> package, and also identifies all the delta between what is installed for
> arm and for aarch64.

Ok, thanks for the clarification, this makes sense.

I like the approach of making those flags for GL/GLES support
conditional on BR2_arm, what was the status on that? Just need someone
to test + format into a series?

Best regards,
Christian
