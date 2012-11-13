From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 13 Nov 2012 00:02:03 -0500
Subject: [Buildroot] howto incorporate buildroot into an autobuild
In-Reply-To: <1352767649.18724.34.camel@genx>
References: <1352767649.18724.34.camel@genx>
Message-ID: <CAHqTa-2vZ_xs26oCX8kFtgQQzGaOcLWG=r2S+hsmUi1E6WZ2Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 12, 2012 at 7:47 PM, John Stile <john@stilen.com> wrote:
> I am using buildroot for an embedded Arm project.
>
> I was wondering how people using buildroot implement continuous
> integration builds?
>
> Do you start from a clean checkout, build the whole tool chain (which
> takes a long time), and then build the project specific stuff?
>
> I worry about not starting from a clean checkout, since some options may
> change, and the tools won't be rebuilt.
>
> But I also worry people will complain how long the build takes.
>
> Is there a good strategy to balance these concerns?

On our project we're using an already-built binary toolchain checked
into git, which we can refresh occasionally.  I don't really like that
setup, but it does significantly reduce the overall build time.

I also severely hacked up buildroot to be able to build multiple
packages in parallel on a multicore machine; this makes builds
typically 2-3x faster on our setup, and probably even more so if you
use a really fast disk (SSD RAID?) and lots of RAM and multiple CPUs.
You can see our hacked-up version here:
http://gfiber.googlesource.com/buildroot

Beware, however, as it may burn your eyes.  Someday I would like to
clean up the parallelism patches and submit them here.

Have fun,

Avery
