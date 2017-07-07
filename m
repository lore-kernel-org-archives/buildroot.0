From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 10:02:18 +0200
Subject: [Buildroot] [PATCH 3/3] mtd: be explicit about config options
 for the host
In-Reply-To: <b44bd05b-2ba9-d91a-803a-bb35cf4be5ee@mind.be>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
 <20170706205849.22298-3-thomas.petazzoni@free-electrons.com>
 <b44bd05b-2ba9-d91a-803a-bb35cf4be5ee@mind.be>
Message-ID: <20170707100218.09e408c0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 00:57:59 +0200, Arnout Vandecappelle wrote:
> On 06-07-17 22:58, Thomas Petazzoni wrote:
> > Instead of letting auto-detection do its job, be explicit about the
> > fact that we want the JFFS2 and UBIFS utilities when building the host
> > variant of mtd.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/mtd/mtd.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> > index 3bac2d5..807f559 100644
> > --- a/package/mtd/mtd.mk
> > +++ b/package/mtd/mtd.mk
> > @@ -45,7 +45,10 @@ MTD_CONF_OPTS += --without-xattr
> >  endif
> >  
> >  HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
> > -HOST_MTD_CONF_OPTS = --disable-tests
> > +HOST_MTD_CONF_OPTS = \
> > +	--with-jffs \
> > +	--with-ubifs \  
> 
>  If you do this, it would also seem natural to add
> 
> --without-xattr --with-lzo

Indeed for --without-xattr. However, we don't pass
--with-lzo/--without-lzo for the target variant. Perhaps we should as
well.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
