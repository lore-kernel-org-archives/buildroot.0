From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 12:51:46 +0100
Subject: [Buildroot] [PATCH 1/3] package/dvb-apps: fix build with some
 perl version
In-Reply-To: <20171127113946.63vjfrc6p5iabz7k@sapphire.tkos.co.il>
References: <cover.1511779719.git.yann.morin.1998@free.fr>
 <3756298044e002e93aa851a58b8337e6f676c91a.1511779719.git.yann.morin.1998@free.fr>
 <20171127113946.63vjfrc6p5iabz7k@sapphire.tkos.co.il>
Message-ID: <20171127115146.GF2950@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-11-27 13:39 +0200, Baruch Siach spake thusly:
> On Mon, Nov 27, 2017 at 11:48:54AM +0100, Yann E. MORIN wrote:
> > perl can't find a module that is located in the current directory,
> > so help it locate it.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Francois Perrad <francois.perrad@gadz.org>
> > 
> > ---
> > Note: I have no idea why perl on my machine does not find that file,
> > while it does on all the autobuilders so far... I just assume that this
> > is a perl version issue, but I may very well be wrong. Fran?ois ?
> 
> This might have something to do with the removal of current directory from 
> @INC in Debian:
> 
>   https://lists.debian.org/debian-devel-announce/2016/08/msg00013.html

Wee! So I was not so insane after all! ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

> baruch
> 
> > ---
> >  package/dvb-apps/dvb-apps.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
> > index 8ba1501d5c..8aa4a29307 100644
> > --- a/package/dvb-apps/dvb-apps.mk
> > +++ b/package/dvb-apps/dvb-apps.mk
> > @@ -15,6 +15,8 @@ DVB_APPS_DEPENDENCIES = libiconv
> >  DVB_APPS_LDLIBS += -liconv
> >  endif
> >  
> > +DVB_APPS_MAKE_OPTS = PERL5LIB=$(@D)/util/scan
> > +
> >  ifeq ($(BR2_STATIC_LIBS),y)
> >  DVB_APPS_MAKE_OPTS += enable_shared=no
> >  else ifeq ($(BR2_SHARED_LIBS),y)
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
