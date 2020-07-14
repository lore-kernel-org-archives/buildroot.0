From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 15:55:18 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/cups-filters: fix build without dejavu font
In-Reply-To: <20200714154922.0bad332b@windsurf.home>
References: <20200714112308.3264764-1-fontaine.fabrice@gmail.com>
 <20200714144735.56a11bb9@windsurf.home>
 <CAPi7W81nhSFN09_=mR2g8A5kHL1vHzYCzCjarZWWtrAMEDvLCA@mail.gmail.com>
 <20200714154922.0bad332b@windsurf.home>
Message-ID: <CAPi7W80Xhbo9DWmTbY+5ykMF068HFCiXOQMEfmZzVHj+Y_nwuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 14 juil. 2020 ? 15:49, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 14 Jul 2020 15:09:25 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > This doesn't seem right. Am I missing something here ?
> > This font is only used for test programs and Yann even suggested me to
> > point to /dev/null in the first review of this patch.
> > In particular, TESTFONT is used by fontembed/main.c only if the user
> > does not provide any arguments:
> >
> > const char *fn=TESTFONT;
> > if (argc==2) {
> > fn=argv[1];
> > }
> >
> > However, if you think it's better to use --with-test-font-path to set
> > the test font path to /usr/share/fonts/dejavu/DejaVuSans.ttf (i.e. the
> > default value when cups-filters does not find it on the build
> > machine), I can send a v3.
> > But this does not seem better to hardcode this path without adding a
> > dependency on dejavu ...
>
> I think it would be better to not hardcode any path at all, so perhaps
> Yann's suggestion of using /dev/null is a good option here.
Then I'll send a new pull request upstream that replaces "test -f" by
"test -e" because /dev/null is not a regular file.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
