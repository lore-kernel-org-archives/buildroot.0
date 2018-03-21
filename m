From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 22:16:08 +0200
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180321211310.50f6410c@windsurf>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
 <20180321170413.74jd5vq4ygcgbewp@tarshish>
 <20180321211310.50f6410c@windsurf>
Message-ID: <20180321201608.jrkkauvpiwcla6js@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 21, 2018 at 09:13:10PM +0100, Thomas Petazzoni wrote:
> On Wed, 21 Mar 2018 19:04:13 +0200, Baruch Siach wrote:
> > >  ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
> > > -DROPBEAR_CONF_OPTS += --disable-zlib
> > > +DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
> > >  else
> > >  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
> > > -DROPBEAR_DEPENDENCIES += zlib
> > > +DROPBEAR_DEPENDENCIES += zlib libtomcrypt
> > > +DROPBEAR_CONF_OPTS += --disable-bundled-libtom  
> > 
> > As I said on v2[1] I think that unbundling static libraries is not worth it.
> > 
> > [1] http://patchwork.ozlabs.org/comment/1879448/
> 
> I am not sure why you say that. In general, I think unbundling is good.
> Why should we make an exception here ?

Here is my full commit on v2:

Since both libraries are static only, this does not reduce the binary size. On
the other hand, bundled libraries are more likely to work correctly with any
give version of dropbear. The only benefit of using external libraries is when
there is a security update to the libraries. But unless there is a known issue
now, I'm not sure it's worth it.

Do you see other reasons to prefer unbundling?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
