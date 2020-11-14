From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 14 Nov 2020 17:17:20 +1300
Subject: [Buildroot] [PATCH] package/syslog-ng: Ignore CVE-2008-5110
In-Reply-To: <CAFOYHZD5JPwL5F3QjAmfbn-J9SOYfM1m=+86TMF+aJx=zZ+ynQ@mail.gmail.com>
References: <20201021074424.13589-1-judge.packham@gmail.com>
 <20201022154328.26b50fad@windsurf.home>
 <CAFOYHZDWmUDZiT6b=kJfL+JPnU8LV5k-swsWjsnP1wh_8mNMXw@mail.gmail.com>
 <CAFOYHZD5JPwL5F3QjAmfbn-J9SOYfM1m=+86TMF+aJx=zZ+ynQ@mail.gmail.com>
Message-ID: <CAFOYHZAutmeDOJoWcumNcozvF1HzziXP4DWjhjA+WkpCy5SGgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Nov 2020, 8:22 PM Chris Packham, <judge.packham@gmail.com> wrote:

> On Mon, Nov 2, 2020 at 7:54 PM Chris Packham <judge.packham@gmail.com>
> wrote:
> >
> > Hi Thomas,
> >
> > On Fri, Oct 23, 2020 at 2:43 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > Hello Chris,
> > >
> > > On Wed, 21 Oct 2020 20:44:24 +1300
> > > Chris Packham <judge.packham@gmail.com> wrote:
> > >
> > > > This as fixed in syslog-ng 2.0.10 but the NVD database hasn't been
> > > > updated.
> > > >
> > > > Signed-off-by: Chris Packham <judge.packham@gmail.com>
> > > > ---
> > > >  package/syslog-ng/syslog-ng.mk | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/
> syslog-ng.mk
> > > > index 7c2368efba..8587da746a 100644
> > > > --- a/package/syslog-ng/syslog-ng.mk
> > > > +++ b/package/syslog-ng/syslog-ng.mk
> > > > @@ -17,6 +17,10 @@ SYSLOG_NG_AUTORECONF = YES
> > > >  SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
> > > >       --disable-java --disable-java-modules --disable-mongodb
> > > >
> > > > +# CVE-2008-5110 was fixed in syslog-ng 2.0.10 but the NVD database
> is not
> > > > +# aware of the fix, ignore it
> > > > +SYSLOG_NG_IGNORE_CVES += CVE-2008-5110
> > >
> > > But as proposed over e-mail separately, the proper fix is to modify the
> > > NVD database. Have you had the chance to report the issue to the NVD
> > > database maintainers ?
> > >
> >
> > Sorry for taking so long to get back. I have reported the issue.
> > Apparently I should be getting an email with a ticket number but no
> > sign of it yet.
> >
>
> They've bumped me on to secalert at redhat.com so we'll see how that goes.
>

Looks like the text has been updated to say that the vulnerability affects
versions up to 2.0.9 but the cpe info hasn't been updated yet.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201114/4901126c/attachment.html>
