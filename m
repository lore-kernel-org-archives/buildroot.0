From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:43:20 +0100
Subject: [Buildroot] [PATCH 03/12] package/pkg-utils.mk: rework
 implementation of extractor-system-dependency
In-Reply-To: <65eac3bd-f2c5-124c-7448-541b8b0a525b@smile.fr>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
 <20191210215952.902477-4-thomas.petazzoni@bootlin.com>
 <65eac3bd-f2c5-124c-7448-541b8b0a525b@smile.fr>
Message-ID: <20191214224320.19b7f0fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 22:37:14 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index 35a441e0aa..d324934dba 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -62,8 +62,8 @@ extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))
> >  # $(firstword) is used here because the extractor can have arguments,
> >  # like ZCAT="gzip -d -c", and to check for the dependency we only want
> >  # 'gzip'.
> > -extractor-system-dependency = $(firstword $(INFLATE$(filter-out \
> > -	$(EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS),$(suffix $(1)))))
> > +extractor-system-dependency = $(if $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1))),,\  
> 
> I would add a "." after EXTRACTOR_PKG_DEPENDENCY because we want to use
> "EXTRACTOR_PKG_DEPENDENCY.$(suffix $(1))"

You're absolutely right. Now I wonder how it could have worked with my
code. I did quite a bit of testing, verifying the values of a number of
internal variables in various situations to make sure it was all
working well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
