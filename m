From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 23:17:55 +0200
Subject: [Buildroot] [PATCHv2] toolchain: Add glibc support for ARCv2
In-Reply-To: <20171010133150.42030-1-didin@synopsys.com>
References: <20171010133150.42030-1-didin@synopsys.com>
Message-ID: <20171010231755.110e806b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks, I've applied to master. One comment below.

On Tue, 10 Oct 2017 16:31:50 +0300, Evgeniy Didin wrote:
> Finally there's working ARC port of glibc thanks to Vineet and Cuper!
> This port is based on pretty recent glibc's master branch and ARC
> changes are being reviewed now in glibc's mailing list.
> 
> Thus we again have to use sources from our GitHub but as soon as there's
> a glibc release with our patches applied we'll switch to upstream releases
> and will drop our glibc GitHub repo alltogether.
> 
> Note now we cut tags in glibc repo simultaneously with tags
> in Binutils and GCC repos and so to make sure everything works in the best
> way we plan to update glibc tag together with Binutils and GCC.
> 
> Also note as of today ARCompact (AKA ARCv1 ISA) is not supported in glibc
> but we plan to fix it soonish so for now we make glibc intentionally
> dependent on archs38.
> 
> Also note we are not creating directory "2.26" because all patches for glibc
> ver 2.26 applies to arc glibc port.

This last thing will probably cause problems in the future: when we
will add new glibc patches, they may not work with the ARC version of
glibc, or when we bump to glibc 2.26.1, the ARC version of glibc will
probably not be rebased at exactly the same time.

So I've left it as-is for now, but I'm pretty sure we'll have to switch
to per-version directories very soon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
