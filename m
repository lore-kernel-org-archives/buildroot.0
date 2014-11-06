From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 16:01:41 +0100
Subject: [Buildroot] [PATCH 1/1] exiv2: new package
In-Reply-To: <545B831C.6050908@sensefly.com>
References: <1415197829-7086-1-git-send-email-nicolas.serafini@sensefly.com>
 <20141106083050.60e4d614@free-electrons.com>
 <545B831C.6050908@sensefly.com>
Message-ID: <20141106160141.61314607@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

On Thu, 6 Nov 2014 15:18:04 +0100, Nicolas Serafini wrote:

> Ok I fix this.
> I have not found the rule for maximum column in Config.in and *.mk files 
> in the manual. Maybe we should add.

Feel free to submit a patch :-)

> >> +ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
> >> +EXIV2_CONF_OPTS += --enable-commercial --disable-nls --disable-lensdata
> >> +endif
> >
> > Why --disable-nls here? It is already passed automatically by the
> > package infrastructure when locale support is not available.
> >
> > Maybe a comment about why --disable-lensdata is passed when the
> > commercial license is used would be useful.
> 
> The --disable-lensdata disable an included Nikon lens database for 
> conversion to readable lens name and this database is free use only in 
> non-commercial projects.

This is *bad*. It's not because you use the GPLv2 version of the
library that you're not making a commercial product. So please add a
separate Config.in option for this lensdata, disabled by default, with
a warning in the Config.in help text.

> For the --disable-nls, I don't know exactly why it's requested in 
> commercial version.
> This is what is specified in the README file.

Then please add a comment above the usage of --disable-nls to explain
that.

> >> +ifeq ($(BR2_PACKAGE_EXIV2_XMP),y)
> >> +EXIV2_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr/lib
> >
> > Maybe --enable-xmp here?
> 
> It works in both cases because XMP is automatically enabled if expat is 
> found.

If --enable-xmp exists, then I would prefer to see it explicitly used.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
