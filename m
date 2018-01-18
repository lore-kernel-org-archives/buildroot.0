From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 09:03:19 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20180118074850.GA10580@itchy>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home>
 <20171228175256.GA24806@ned> <20171228223629.0fd45695@windsurf>
 <20180118074850.GA10580@itchy>
Message-ID: <20180118090319.3d32c593@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Thu, 18 Jan 2018 08:48:50 +0100, Eric Le Bihan wrote:

> On 2017-12-28 22:36, Thomas Petazzoni wrote:
> >
> > Two other things that would be nice to do is:
> >
> >  - Add two test cases in support/testing/. One that builds a system with
> >    rust-bin, builds a hello world program in Rust, and run it on the
> >    target. And another that does the same, but by building the rust
> >    compiler from source. Perhaps additional test cases can be added for
> >    Cargo, but I'm not sure how it's supposed to be used.  
> 
> Is there a glibc-based toolchain suitable for arm vexpress available on
> http://autobuild.buildroot.org/toolchains/tarballs/?

Use the Linaro ARM toolchain ?

> I see br-aarch64-glibc-2017.05-1078-g95b1dae.tar.bz2, but there is no
> support for Aarch64 in testing

I'm not sure what you mean by "no support for AArch64 in testing". The
testing infrastructure can test any arbitrary configuration, so there
is nothing like "support for architecture <foo> in testing". Perhaps
you are confused by BASIC_TOOLCHAIN_CONFIG being an ARM toolchain
configuration. But this BASIC_TOOLCHAIN_CONFIG is not mandatory, it is
just one toolchain configuration that you can use if your test doesn't
really care about the architecture/toolchain.

We have tests like support/testing/tests/fs/test_iso9660.py that don't
use BASIC_TOOLCHAIN_CONFIG.

> and no artefacts are available.

I'm not sure what "artefacts" you are looking for here.

If you need an ARM or AArcH64 glibc toolchain, just use the Linaro
external toolchains I'd say.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
