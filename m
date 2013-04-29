From: Rico Bachmann <bachmann@tofwerk.com>
Date: Mon, 29 Apr 2013 13:23:07 +0200
Subject: [Buildroot] [PATCH] Add package subversion
In-Reply-To: <20130429110301.GB25186@sapphire.tkos.co.il>
References: <1367231746-30319-1-git-send-email-bachmann@tofwerk.com>
 <20130429110301.GB25186@sapphire.tkos.co.il>
Message-ID: <000901ce44cb$ecc77eb0$c6567c10$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch

> -----Urspr?ngliche Nachricht-----
> Von: Baruch Siach [mailto:baruch at tkos.co.il]
> Gesendet: Montag, 29. April 2013 13:03
> An: Rico Bachmann
> Cc: buildroot at uclibc.org
> Betreff: Re: [Buildroot] [PATCH] Add package subversion
> 
> Hi Rico,
> 
> On Mon, Apr 29, 2013 at 12:35:46PM +0200, Rico Bachmann wrote:
> > Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> > ---
> 
> [snip]
> 
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_SUBVERSION
> > +	bool "subversion"
> > +	select BR2_PACKAGE_APR_UTIL
> 
> select BR2_PACKAGE_EXPAT

I add this line in a new patch version

> 
> > +	# apr really needs shared library support
> > +	depends on !BR2_PREFER_STATIC_LIB
> > +	help
> > +	  Subversion is an open source version control system
> > +
> > +	  http://subversion.apache.org/
> 
> [snip]
> 
> > +SUBVERSION_VERSION = 1.7.9
> > +SUBVERSION_SITE = http://archive.apache.org/dist/subversion
> > +SUBVERSION_DEPENDENCIES = apr apr-util expat SUBVERSION_CONF_OPT = \
> > +	--with-expat=$(STAGING_DIR)/usr:$(STAGING_DIR)/usr:expat \
> 
> The ":$(STAGING_DIR)/usr:expat" part looks wrong. Are you sure this is
> needed?

I check if the ":$(STAGING_DIR)/usr:expat" part is really needed, before I
send the new patch version.

> 
> > +	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION) \
> > +	--with-apr-util=$(BUILD_DIR)/apr-util-$(APR_UTIL_VERSION)
> 
> [snip]
> 
> baruch
> 
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo----------
> --{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

I'll send the new patch version during this day.

Greez
Rico
