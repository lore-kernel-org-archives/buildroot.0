From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Oct 2019 10:06:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: fixup the 'v'
 prefix in the version
In-Reply-To: <20191025093037.4844c199@windsurf.dhcp.lyon.intranet>
References: <20191024180653.13243-1-fontaine.fabrice@gmail.com>
 <20191024222536.0032411f@windsurf.home>
 <CAEyMn7Y1+YxD9eny8urnpSnQiqp1CQiNoYSQnXajhJJAFfR-1Q@mail.gmail.com>
 <20191025093037.4844c199@windsurf.dhcp.lyon.intranet>
Message-ID: <CAPi7W80W0yj6L=RM4mNF-0RFDKXDORcyi3e39Vi9BOuWu5ELKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le ven. 25 oct. 2019 ? 09:30, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Fri, 25 Oct 2019 08:55:01 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > Perhaps it would make sense to add a check in the check-package logic,
> > > to verify that the version doesn't look like vX.Y.Z ?
> >
> > I would like to take care of that.
>
> Then you can poke around in utils/checkpackagelib/lib_mk.py and see to
> add another check. I'm not sure how the check should work exactly, but
> I'll let you figure that out :-)
At very least, we should just check that there is no v prefix, this is
the only requirement from release-monitoring: "Anitya will
automatically strip this from versions it finds." (see
https://release-monitoring.org/static/docs/user-guide.html#creating-a-new-project).

release-monitoring doesn't require that the version is in the X.Y.Z
form, X-Y-Z or X_Y_Z is allowed (and used in some packages).
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
