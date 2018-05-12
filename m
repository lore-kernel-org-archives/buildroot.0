From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 12 May 2018 12:34:19 -0400
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <20180512142738.GB3674@momiji.home>
References: <20180511172314.28ba9f80@windsurf.home>
 <20180511215508.GA28572@jaya>
 <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
 <704976570.261553.1526089365924.JavaMail.zimbra@datacom.com.br>
 <20180512142738.GB3674@momiji.home>
Message-ID: <CAFSsvmq22LCwdnodDZGW7JO__jH-XSWqY2TfE5oXz+cEu5Akvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 12, 2018 at 9:28 AM Adrian Perez de Castro <aperez@igalia.com>
wrote:

> On Fri, 11 May 2018 22:42:45 -0300 (BRT), Carlos Santos <
> casantos at datacom.ind.br> wrote:
> > > From: "ratbert90" <aduskett@gmail.com>
> > > To: anisse at astier.eu, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com
> >
> > > Cc: "Olof Johansson" <olof@lixom.net>, buildroot at uclibc.org
> > > Sent: Friday, May 11, 2018 10:22:49 PM
> > > Subject: Re: [Buildroot] Tesla is using Buildroot
> > >
> > > [...]
> > >
> > > - there's a tesla-verity package which seems to be a custom init that
> > > checks the validity of the verity metadata and interacts with
> > > firmware to check soc lock status before calling dmsetup.
> > > - there are a few packages that look like backports: python-dateutil,
> > > nanomsg, python-pytz, python-jsonschema
> > > - tesla-binutils is a "real" host binutils (non-cross)
> > > - there's tesla-libsystemd stub that builds a libsystemd with stubbed
> > > functions
> >
> > Makes me wonder why they don't use a BR2_EXTERNAL.
>
> Probably because (AFAIK) it is not yet possible to override base package in
> a BR2_EXTERNAL. I have tripped on this myself a couple of times, and ended
> up providing a top-level Makefile in the repo for my BR2_EXTERNAL which
> downloads a certain version of the Buildroot tarball and applies a couple
> of patches over it, then proceeds to chain up to the Buildroot Makefiles
> passing the path BR2_EXTERNAL path down to them (so from the point of view
> of somebody building, they just download the BR2_EXTERNAL repo and do ?make
> foo_defconfig && make?).
>
> It would be great to allow overriding base packages in a BR2_EXTERNAL ?
>
> Cheers,
>
>
> --
>  Adri?n ?
>
Interesting. My solution is to have a base stock BuildRoot folder and then
seperate company folder submodule.
In that submodule is a package directory and a patch directory. Any
packages I want to overwrite I just move to
the company/packages folder and then remove the base package from the base
package directory.

It's worked great for years that way. With the added benefit that when a
new BuildRoot is released, it's as easy as
removing everything but the company folder, dumping the new buildroot into
the base directory, and reapplying the
patches.

Adam


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180512/b665d91a/attachment.html>
