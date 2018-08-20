From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 20 Aug 2018 18:25:26 -0500
Subject: [Buildroot] [PATCH v4 2/2] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <20180821002037.200a2986@windsurf>
References: <1534209477-11544-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1534209477-11544-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180821002037.200a2986@windsurf>
Message-ID: <CANQCQpayN1thGivAo2aT0nmr7h28VbUpSUKQoXA-4Dc65uLzUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Aug 20, 2018 at 5:20 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 13 Aug 2018 20:17:57 -0500, Matt Weber wrote:
> > Catch the commonly used options of SSP, Relro, and fortify.
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> I can't really apply this one currently, because it depends on the
> wrapper stuff I believe. Indeed the TestRelro test fails to build with:
>
> /home/thomas/projets/outputs/TestRelro/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/6.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: -r and -pie may not be used together
> collect2: error: ld returned 1 exit status
> make[3]: *** [scripts/Makefile.build:264: applets/built-in.o] Error 1
> make[2]: *** [Makefile:372: applets_dir] Error 2
> make[1]: *** [package/pkg-generic.mk:232: /home/thomas/projets/outputs/TestRelro/build/busybox-1.29.1/.stamp_built]
> Error 2

Ah true, I removed busybox from the elf files I test but didn't set
the build configuration to not build busybox.  It's probably not worth
the time to fix this patch and instead to get the wrapper complete.
I'll continue on the wrapper tonight and see where I get.

Matt
