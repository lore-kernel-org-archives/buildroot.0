From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 Oct 2017 16:05:54 +0000
Subject: [Buildroot] [PATCHv2] toolchain: Add glibc support for ARCv2
In-Reply-To: <20171010231755.110e806b@windsurf.lan>
References: <20171010133150.42030-1-didin@synopsys.com>
 <20171010231755.110e806b@windsurf.lan>
Message-ID: <4881796E12491D4BB15146FE0209CE6467F96B35@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Wednesday, October 11, 2017 12:18 AM
> To: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: buildroot at busybox.net; Cupertino Miranda <Cupertino.Miranda@synopsys.com>; Vineet Gupta
> <Vineet.Gupta1@synopsys.com>; Alexey Brodkin <Alexey.Brodkin@synopsys.com>; Anton Kolesov
> <Anton.Kolesov@synopsys.com>; Romain Naour <romain.naour@gmail.com>
> Subject: Re: [Buildroot] [PATCHv2] toolchain: Add glibc support for ARCv2
> 
> Hello,
> 
> Thanks, I've applied to master. One comment below.

Cool, thanks!
Do you want me to submit something like
web/toolchains/configs/br-arc-full-internal-glibc.config or
you're going to do it yourself?

> On Tue, 10 Oct 2017 16:31:50 +0300, Evgeniy Didin wrote:
> > Finally there's working ARC port of glibc thanks to Vineet and Cuper!
> > This port is based on pretty recent glibc's master branch and ARC
> > changes are being reviewed now in glibc's mailing list.
> >
> > Thus we again have to use sources from our GitHub but as soon as there's
> > a glibc release with our patches applied we'll switch to upstream releases
> > and will drop our glibc GitHub repo alltogether.
> >
> > Note now we cut tags in glibc repo simultaneously with tags
> > in Binutils and GCC repos and so to make sure everything works in the best
> > way we plan to update glibc tag together with Binutils and GCC.
> >
> > Also note as of today ARCompact (AKA ARCv1 ISA) is not supported in glibc
> > but we plan to fix it soonish so for now we make glibc intentionally
> > dependent on archs38.
> >
> > Also note we are not creating directory "2.26" because all patches for glibc
> > ver 2.26 applies to arc glibc port.
> 
> This last thing will probably cause problems in the future: when we
> will add new glibc patches, they may not work with the ARC version of
> glibc, or when we bump to glibc 2.26.1, the ARC version of glibc will
> probably not be rebased at exactly the same time.
> 
> So I've left it as-is for now, but I'm pretty sure we'll have to switch
> to per-version directories very soon.

That's understood and initially we planned to have a separate folder.
But:
 1) [Especially now] it makes no sense to have 2 folders with the same patches
 2) We're going to update our glibc version to rc2 and final release in coming weeks
     and with the folder in place bump patches will be much bigger for nothing
 3) There's a chance newer patches will just apply smoothly which might benefit
     ARC toolchain (if the patch in question fixes generic stuff).
 4) In the worst case we'll create folders :)

-Alexey
