From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 15:35:10 +0100
Subject: [Buildroot] Unable to build an image with systemd
In-Reply-To: <CAJCNcEb8aemsJ3YrRwK78mv_XTAOsTx54mWaGBoy22uF6zAynA@mail.gmail.com>
References: <CAJCNcEb8aemsJ3YrRwK78mv_XTAOsTx54mWaGBoy22uF6zAynA@mail.gmail.com>
Message-ID: <20171030153510.35066d4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 13:57:24 +0100, Gorka Lertxundi wrote:

> Yesterday I run into this issue I didn't know how to proceed, can anyone
> help me?
> 
> configure: error: *** libmount support required but libraries not found
> package/pkg-generic.mk:217: recipe for target
> '/buildroot-src/output/build/systemd-234/.stamp_configured' failed
> make: *** [/buildroot-src/output/build/systemd-234/.stamp_configured] Error
> 1

Could you please provide a simple Buildroot .config that exhibits the
issue ?

> Cross compiling to ARM using the 2017.08.1 release which supposedly has the
> systemd and libmount issue solved long time ago[1]. I don't know how it's
> possible my build is outputting that all the time.
> 
> systemd uses pkg-config to check if libmount exists and, as expected, using
> the host-deployed pkg-config wasn't able to find it.

Why "as expected" ?

> I manually created mount.pc in
> "output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/mount.pc"

Why would you do this? It should have been installed by util-linux.

When reporting bug reports, please always include a Buildroot .config
file that allows to reproduce the issue. Also, make sure that the
problem is reproducible after a full clean build, i.e when doing "make
clean all".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
