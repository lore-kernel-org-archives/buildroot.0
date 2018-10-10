From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 10 Oct 2018 09:33:49 +0200
Subject: [Buildroot] [PATCH 12/13] pkg-perl: add a target which upgrades
 all packages from metacpan
In-Reply-To: <20181010091049.241adca4@windsurf>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
 <20181010064621.19253-13-francois.perrad@gadz.org>
 <20181010091049.241adca4@windsurf>
Message-ID: <CAB0FRsu56_UpK0EHAhVrMr5Z1Pc=Oeqr9YhU+vMHQog_bc2wtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 10 oct. 2018 ? 09:11, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Wed, 10 Oct 2018 08:46:20 +0200, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/pkg-perl.mk | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> > index 07348bd5d..74a116075 100644
> > --- a/package/pkg-perl.mk
> > +++ b/package/pkg-perl.mk
> > @@ -57,6 +57,10 @@ endif
> >  #       used no matter the setting
> >  $(2)_PREFER_INSTALLER ?= MB
> >
> > +ifeq ($(4),target)
> > +SCANCPAN_ALL_DISTRIB += $$($(2)_DISTNAME)
> > +endif
>
> I'm curious to understand why you're adding only target Perl packages.
>

 `scancpan` fetch recursively all dependencies of a package.


> We don't want to update also host Perl packages ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181010/ee0af0e4/attachment.html>
