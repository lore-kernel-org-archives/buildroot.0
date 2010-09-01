From: Mitch Davis <mjd+buildroot@afork.com>
Date: Wed, 1 Sep 2010 12:38:06 +1000
Subject: [Buildroot] No compiler is embedded to the file system.
In-Reply-To: <BLU118-W2785FD86090F0EF9B015FAD68B0@phx.gbl>
References: <BLU118-W21A6465BFFC320F704EC54D68A0@phx.gbl>
	<AANLkTi=uFnF5Hwueqi1u-L_Zks=y6c9EKZBueK7FgK_6@mail.gmail.com>
	<BLU118-W2785FD86090F0EF9B015FAD68B0@phx.gbl>
Message-ID: <AANLkTikBS9+gXAwnR1QwmqNoqYaQ9V_QQub3xwBbng6R@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 1, 2010 at 12:31 PM, mohammed dahdouh <meodou@hotmail.com> wrote:
> Hi,
> First, Thanks for the reply.I misunderstood the documentation in fact I was
> expecting a cross compiler there. My understanding was that the buildroot is
> an independent File system containing cross compile toolchain. While the
> cross-compile toolchain should? available in out/staging. I m compiling
> again to check that.
> Btw what is the difference between the options : "external toolchain" and
> "buildroot toolchain"?

With "buildroot toolchain", the compiler, run-time libraries and so
forth will be built by buildroot for buildroot to use when
cross-compiling packages.  Sometimes however, a board vendor supplies
a modified toolchain (or even worse, just binaries).  In this case,
one can point buildroot to use a pre-compiled toolchain.

In addition, builds from scratch are much faster if buildroot doesn't
have to build the toolchain, so one can build a toolchain using
buildroot, then refer to this later as an external toolchain.

Mitch.
