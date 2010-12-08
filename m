From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 08 Dec 2010 22:00:47 +0100
Subject: [Buildroot] [PATCH 01/17] gdk-pixbuf: fix dependency on libiconv
In-Reply-To: <20101208200852.210480da@surf>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-2-git-send-email-llandwerlin@gmail.com>
	<20101208200852.210480da@surf>
Message-ID: <1291842047.24014.164.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mercredi 08 d?cembre 2010 ? 20:08 +0100, Thomas Petazzoni a ?crit :
> On Wed,  8 Dec 2010 10:53:53 +0100
> llandwerlin at gmail.com wrote:
> 
> > +GDK_PIXBUF_DEPENDENCIES += \
> > +	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
> > +	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
> > +	host-pkg-config libglib2
> 
> Then maybe, in package/gdk-pixbuf/Config.in:
> 
> 	select BR2_PACKAGE_ICONV if !BR2_ENABLE_LOCALE
> 
>  ?
> 

Sure, thx !
