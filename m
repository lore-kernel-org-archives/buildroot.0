From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 28 Jan 2020 01:39:57 +0200
Subject: [Buildroot] host-python-2.7 failure to build _hashlib
In-Reply-To: <20200127234031.79371041@windsurf>
References: <CA+h21hors57FFbQzm0x2Rd_pABb95-GaxPOPiRQ5ZzB9NgT-Mg@mail.gmail.com>
 <20200127234031.79371041@windsurf>
Message-ID: <CA+h21hr2ReX5zxqmRrM9dq77S-nwqSQvmTQh6N-FLEvoooUfLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 28 Jan 2020 at 00:40, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Vladimir,
>
> On Tue, 28 Jan 2020 00:35:49 +0200
> Vladimir Oltean <olteanv@gmail.com> wrote:
>
> > Ok, but I have to ask: why is host-python even built at all? For one
> > thing, BR2_PACKAGE_HOST_PYTHON is not set.
> > But with "make graph-depends", I am able to see that host-python is
> > dragged in by:
> > - python itself, which I selected
> > - host-python-setuptools (dragged in by python-lxml, which I selected)
> > - host-nodejs (dragged in by nodejs, which I selected)
>
> Right, host-python is a dependency of all those things indeed.
>
> > Granted, I don't know much, but I'm baffled that:
> > - None of the above 3 packages select BR2_PACKAGE_HOST_PYTHON in their Config.in
>
> Because we don't enforce this for host packages. We do enforce it for
> target packages (i.e a target package cannot be built if its Config.in
> option is not enabled somehow). But we don't enforce it for host
> packages.
>
> For example, host-pkgconf has a visible Config.in option called
> BR2_PACKAGE_HOST_PKGCONF. However, almost none of the packages that
> depend on host-pkgconf have a select BR2_PACKAGE_HOST_PKGCONF.
>

Why not?

> > - The Makefile doesn't complain that they don't (usually it does, when
> > packages add _DEPENDENCIES that are absent from Config.in)
>
> See above: only for target packages.
>
> > When I enable BR2_PACKAGE_HOST_PYTHON and BR2_PACKAGE_HOST_PYTHON_SSL
> > in .config, I am able to carry on with the build.
> >
> > Can somebody please explain what is going on?
> > I am not a proficient Python user either, by the way.
>
> I don't really understand why your host-python package fails to build.
> Could you share the entire build log of the host-python package ?
>

So it looks like the mailing list didn't like my log pasted in here.
Let's try Github gists:
https://gist.github.com/vladimiroltean/4d6b1441b0dbe64dc8e2f9d1ce336e42

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks,
-Vladimir
