From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 30 Apr 2013 15:53:15 +0200
Subject: [Buildroot] [PATCH] Add package subversion
In-Reply-To: <20130429110301.GB25186@sapphire.tkos.co.il>
References: <1367231746-30319-1-git-send-email-bachmann@tofwerk.com>
 <20130429110301.GB25186@sapphire.tkos.co.il>
Message-ID: <000601ce45aa$10871c50$319554f0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

I found some other issues I have to fix (for neon and expat).
I will add a nice solution to choos which feature are enabled in subversion

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
> > +SUBVERSION_DEPENDENCIES = apr apr-util expat
> > +SUBVERSION_CONF_OPT = \
> > +	--with-expat=$(STAGING_DIR)/usr:$(STAGING_DIR)/usr:expat \
> 
> The ":$(STAGING_DIR)/usr:expat" part looks wrong. Are you sure this is
> needed?

I couldn't get it running without this part. I will let this line as it is.

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

I should send the new patch during this or next week, can't say excatly when
I find the time.
