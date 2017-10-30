From: Gorka Lertxundi <glertxundi@gmail.com>
Date: Mon, 30 Oct 2017 16:14:21 +0100
Subject: [Buildroot] Unable to build an image with systemd
In-Reply-To: <20171030153510.35066d4a@windsurf>
References: <CAJCNcEb8aemsJ3YrRwK78mv_XTAOsTx54mWaGBoy22uF6zAynA@mail.gmail.com>
 <20171030153510.35066d4a@windsurf>
Message-ID: <CAJCNcEb4+FOpcFD7ES6EHGtwWegY3WLxtFc6SsOS-ziY3dg-7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for getting me this fast.

2017-10-30 15:35 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon, 30 Oct 2017 13:57:24 +0100, Gorka Lertxundi wrote:
>
> > Yesterday I run into this issue I didn't know how to proceed, can anyone
> > help me?
> >
> > configure: error: *** libmount support required but libraries not found
> > package/pkg-generic.mk:217: recipe for target
> > '/buildroot-src/output/build/systemd-234/.stamp_configured' failed
> > make: *** [/buildroot-src/output/build/systemd-234/.stamp_configured]
> Error
> > 1
>
> Could you please provide a simple Buildroot .config that exhibits the
> issue ?
>

https://gist.github.com/glerchundi/bafbb5c3b7b15c48e4058bb05d890edf


>
> > Cross compiling to ARM using the 2017.08.1 release which supposedly has
> the
> > systemd and libmount issue solved long time ago[1]. I don't know how it's
> > possible my build is outputting that all the time.
> >
> > systemd uses pkg-config to check if libmount exists and, as expected,
> using
> > the host-deployed pkg-config wasn't able to find it.
>
> Why "as expected" ?
>

As expected because that was the reason why systemd failed in ./configure.
That doesn't mean that it's the root of the problem of course, probably is
my fault...


>
> > I manually created mount.pc in
> > "output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/
> lib/pkgconfig/mount.pc"
>
> Why would you do this? It should have been installed by util-linux.
>
> When reporting bug reports, please always include a Buildroot .config
> file that allows to reproduce the issue. Also, make sure that the
> problem is reproducible after a full clean build, i.e when doing "make
> clean all".
>

Yeah, sounds reasonable. Will do next time sorry about that.

I started taking the customizations from jumpnow (
https://github.com/jumpnow/buildroot) and include them one-by-one on the
original buildroot but when I changed from sysv to systemd this one failed
to build.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171030/0cb9b0ed/attachment.html>
