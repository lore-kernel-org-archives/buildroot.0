From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 5 Nov 2020 11:20:49 -0600
Subject: [Buildroot] [PATCH 08/10] support/script/pkg-stats: show CPE ID
 in results
In-Reply-To: <20201105180106.1c88c656@windsurf.home>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
 <CANQCQpbN8-SXF8T4bxdn+JnyYrHSzpQy8J2ZzByCZ=yp_gtZNQ@mail.gmail.com>
 <20201105180106.1c88c656@windsurf.home>
Message-ID: <CANQCQpbCh3SRt4JQMdOT2QeJz7hQH4hBY_6J05ouUhOqbWY3vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Thu, Nov 5, 2020 at 11:02 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 4 Nov 2020 11:18:50 -0600
> Matthew Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > > +        elif pkgvar.endswith("_CPE_ID"):
> > > +            pkgvar = pkgvar[:-7]
> > > +            Package.all_cpeids[pkgvar] = value
> >
> > I haven't dug that deep yet in the script, but would this populate
> > host and target CPE ID values?  I know the Infrastructure does note
> > host/target so there is probably enough information to conditionally
> > pull the value.
>
> pkg-stats doesn't have a notion of a package being a host or a target
> package. It knows only about packages, be they target, host, or both.
>
> Also, the CPE_ID values are automatically filled in for the host
> variant of the package by deriving the one of the corresponding target
> package. This is explained in PATCH 03/10 commit log, which states:
>
> """
> The <pkg>_CPE_ID_* values for the host package are inherited from the
> same variables of the corresponding target package, as we normally do
> for most package variables.
> """

Yep, agree I was tracking the fact a host package CPE ID was also
being created.  I was just thinking you could end up with a case of
two CPE IDs, one for a host vs target package.  I guess that really
isn't the case so you can ignore this question.  I was really thinking
of the case like libcurl where the package has two CPE IDs but that
could really be a future patchset problem.

Matt
