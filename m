From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 00:09:12 +0100
Subject: [Buildroot] [PATCH 08/84 RFC] package/alsa-utils: use
 'menuconfig' instead of 'config'+'menu'
In-Reply-To: <568462B4.2030802@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <dfe3c11a00f2b3eec4b08215bf6e7210a2a8647c.1451076704.git.yann.morin.1998@free.fr>
 <568462B4.2030802@mind.be>
Message-ID: <20151230230912.GA13296@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-31 00:03 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:24, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/alsa-utils/Config.in | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
> > index a08743e..762fcdf 100644
> > --- a/package/alsa-utils/Config.in
> > +++ b/package/alsa-utils/Config.in
> > @@ -2,7 +2,7 @@ comment "alsa-utils needs a toolchain w/ threads"
> >  	depends on BR2_USE_MMU # fork
> >  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> >  
> > -config BR2_PACKAGE_ALSA_UTILS
> > +menuconfig BR2_PACKAGE_ALSA_UTILS
> >  	bool "alsa-utils"
> >  	depends on BR2_USE_MMU # fork
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> > @@ -15,7 +15,8 @@ config BR2_PACKAGE_ALSA_UTILS
> >  	  http://www.alsa-project.org/
> >  
> >  if BR2_PACKAGE_ALSA_UTILS
> > -menu "ALSA utils selection"
> > +
> > +comment  "ALSA utils selection"
> 
> I don't think this comment is needed.

I don't care about that comment either. ;-)

>  Also, why do you do it for alsa-utils but
> not alsa-lib?

Because I skimmed through the menuconfig UI, seeeking those constructs,
and alsa-utils is very early, with alsa-lib much later, with a lot of
packages between the two, and I may have changed my mind in-between.

This does not really appear in the series, because I then rebased it and
re-ordered alphabetically on packages' names.

I agree that, when there is a single 'category', there's no need for a
comment. I will drop.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
