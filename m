From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 27 Dec 2017 13:22:24 +0100
Subject: [Buildroot] [PATCH] libiio: fix libavahi-client dependency
In-Reply-To: <20171227121249.bgyakvui5g73jsch@sapphire.tkos.co.il>
References: <20171227120603.14046-1-marcus.folkesson@gmail.com>
 <20171227121249.bgyakvui5g73jsch@sapphire.tkos.co.il>
Message-ID: <20171227122224.GB24556@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Dec 27, 2017 at 02:12:49PM +0200, Baruch Siach wrote:
> Hi Marcus,
> 
> On Wed, Dec 27, 2017 at 01:06:03PM +0100, Marcus Folkesson wrote:
> > Avahi needs avahi-daemon and D-Bus to build avahi-client.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  package/libiio/libiio.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> > index 0b13064085..0ff6c47dba 100644
> > --- a/package/libiio/libiio.mk
> > +++ b/package/libiio/libiio.mk
> > @@ -54,8 +54,8 @@ else
> >  LIBIIO_CONF_OPTS += -DWITH_IIOD_USBD=OFF
> >  endif
> >  
> > -# Avahi support in libiio requires avahi-client, which needs avahi-daemon
> > -ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
> > +# Avahi support in libiio requires avahi-client, which needs avahi-daemon and dbus
> > +ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
> 
> When BR2_PACKAGE_AVAHI_DAEMON is enabled, BR2_PACKAGE_AVAHI must also be 
> enabled. So the is no need to check for BR2_PACKAGE_AVAHI.
> 

You are so right.

> >  LIBIIO_DEPENDENCIES += avahi
> >  endif
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

Best regards
Marcus Folkesson
