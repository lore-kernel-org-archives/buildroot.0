From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Nov 2020 21:35:58 +0100
Subject: [Buildroot] [PATCH next 07/12] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
In-Reply-To: <CALq67GAGhUt56n2d9eLtufxH4jdNYPy14iuMwEK95qhkgWPvDQ@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
 <CALq67GAGhUt56n2d9eLtufxH4jdNYPy14iuMwEK95qhkgWPvDQ@mail.gmail.com>
Message-ID: <20201125213558.31151101@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Wed, 25 Nov 2020 13:46:38 -0600
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> error: no matching package named `aho-corasick` found
> location searched: registry `https://github.com/rust-lang/crates.io-index`
> required by package `globset v0.4.5
> (/home/ryan/projects/br/br-pkg-mgr/output/build/ripgrep-12.1.1/crates/globset)`
> As a reminder, you're using offline mode (--offline) which can
> sometimes cause surprising resolution failures, if this error is too
> confusing you may wish to retry without the offline flag.
> make[1]: *** [package/pkg-generic.mk:250:
> /home/ryan/projects/br/br-pkg-mgr/output/build/ripgrep-12.1.1/.stamp_built]
> Error 101
> make: *** [Makefile:84: _all] Error 2
> 
> I get this error by running the following commands:
> 
> make ripgrep
> make clean ripgrep

[...]

> So it appears that after the rippackage has been downloaded there is
> an issue with doing a clean build. I'm not familiar with cargo/rust
> builds and how the offline component works but it appears that the
> introduction of this cargo infrastructure and the downloading of
> vendor dependencies is not currently reproducible.

Thanks for the report, I'll try to have a look as time permits. I'm
also not that familiar with the Cargo stuff, but we'll see if I can
find something.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
