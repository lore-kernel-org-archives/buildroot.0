From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Dec 2013 11:12:39 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix build for xtensa
In-Reply-To: <20131225100715.6473dee2@skate>
References: <dbffcc9384caa8009093e59944182ddfaafbdb5c.1387910266.git.baruch@tkos.co.il>
 <20131225100715.6473dee2@skate>
Message-ID: <20131225091239.GR11794@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Dec 25, 2013 at 10:07:15AM +0100, Thomas Petazzoni wrote:
> On Tue, 24 Dec 2013 20:37:46 +0200, Baruch Siach wrote:
> > +ifeq ($(BR2_xtensa),y)
> > +FFMPEG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mtext-section-literals"
> > +endif
> 
> Thanks, but to prevent future mistakes, could you provide a slightly
> different version that does:
> 
> FFMPEG_CFLAGS = $(TARGET_CFLAGS)
> 
> ifeq ($(BR2_xtensa),y)
> FFMPEG_CFLAGS += -mtext-section-literals
> endif
> 
> FFMPEG_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"
> 
> This is a little bit better than your version in that we can add things
> to CFLAGS in other places in ffmpeg.mk.

Will do.

Thanks for reviewing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
