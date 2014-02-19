From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 09:18:22 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
In-Reply-To: <CAMKF1soCcLba_EacJLe7f9fM9=gFsTJYj0kaz6YzoXzEY1rx2A@mail.gmail.com>
References: <20140218231447.524a1a20@skate>
 <CAMKF1soCcLba_EacJLe7f9fM9=gFsTJYj0kaz6YzoXzEY1rx2A@mail.gmail.com>
Message-ID: <20140219091822.08d1a87e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Khem Raj,

On Tue, 18 Feb 2014 16:23:11 -0800, Khem Raj wrote:

> > To give you an idea, Buildroot currently has more than 50 patches on
> > top of uClibc 0.9.33.2:
> >
> >   http://git.buildroot.net/buildroot/tree/package/uclibc/0.9.33.2/
> 
> Indeed, I see what you are saying here. In order to begin the process,
> can you send a list of patches
> that buildroot is carrying for inclusion into master.

Peter will confirm, but I believe that *all* our patches are backports
from the 0.9.33 branch at http://git.uclibc.org/uClibc/log/?h=0.9.33.
So there is no special fix in Buildroot that isn't already in mainline
uClibc.

We are not complaining about patches not been integrated into uClibc,
we are complaining about the fact that no stable releases are being
made from uClibc, which creates a lot of fragmentation between
providers of uClibc based toolchains.

> Secondly, would it be just fine if the release is made
> in form of a git branch and no tarballs?

I don't think this would solve the fragmentation problem. If you want
to solve it, you need to make clear stable releases on a regular basis.

And if you make a tag in git, then doing a tarball is just one 'git
archive' invocation away.

> regardless I would request
> all to send/resend the patches that are for master so we can
> collect them on patchwork here
> 
> http://patchwork.ozlabs.org/project/uclibc/list/

As explained above, this is not needed. All the patches we have are
already in mainline uClibc. We just want a release.

> given the patches and development activity we snapshot uclibc trunk
> and that works out ok.

Right, but that doesn't solve the fragmentation problem. When someone
builds an uClibc toolchain with for example Crosstool-NG, or uses the
pre-built uClibc toolchain provided by Analog Devices for the Blackfin
architecture, those toolchains don't have a uClibc with as many
patches as we have in Buildroot, and so they lack some modern system
calls (execvpe, dup3, etc.).

By having regular releases, we would encourage uClibc downstream users
(Crosstool-NG, Analog Devices, and all other projects) to regularly
upgrade, and therefore reduce the fragmentation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
