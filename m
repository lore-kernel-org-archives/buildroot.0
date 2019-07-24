From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 24 Jul 2019 10:32:00 +0300
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: add option to enable
 NLS support
In-Reply-To: <20190724091755.534a0136@windsurf>
References: <20190723172336.24010-1-vadim4j@gmail.com>
 <20190724001359.0a290cf1@windsurf>
 <CAMw6YJKnpyUs_24FqopnwJQke-G=D_LNUwcsCvpDUJH5c5qFvg@mail.gmail.com>
 <20190724091755.534a0136@windsurf>
Message-ID: <CAMw6YJJ6oCkCyPDk4SZKUNHW7rwVph_T8MbbWme0-h1jTgsDKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 24, 2019 at 10:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 24 Jul 2019 10:03:24 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
>
> > > So I think we should instead ensure that test-pkg by default tests the
> > > different combinations that we think are useful to test.
> > >
> >
> > OK, I see, I can only say that usually I use test-pkg for version
> > bumping or checking
> > the package compilation issue reported in 'Buildroot results' mailing
> > if it pass, for *.mk changing and of course
> > for the new packages. So I was thinking that others also use it in
> > such way, and my
> > assumption was that --with-nls option would be useful :)
>
> Yes, others also use it for the same reason. What I meant is only that
> others will most likely not remember they should test with and without
> the --with-nls option. So we should test both NLS enabled and NLS
> disabled configurations in the default test-pkg run perhaps.
>
> But of course then, should we test sysvinit/systemd configurations, to
> make sure the init script installation logic works ? Should we test
> hardening options ? etc. We can't test everything in test-pkg as it
> would make the test too long, and making the test too long will reduce
> the incentive to use this tool.
>

Of course it is better to left it on developers decision what to test
by providing
just config snippet. The goal of this option is just to simplify of
build testing the same package/config
with NLS w/o manually adding NLS related options to the snippet,
because usually it needs to
build the package twice - with and without NLS. If you think it is
useless, I will
reset the patch as rejected, thats ok)

Regards,
Vadim Kochan
