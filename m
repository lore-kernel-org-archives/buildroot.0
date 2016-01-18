From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 23:25:15 +0100
Subject: [Buildroot] [PATCH v2] package/alsa-utils: Add util alsaloop
In-Reply-To: <87io2q4khh.fsf@dell.be.48ers.dk>
References: <1453151639-28753-1-git-send-email-bernd.kuhls@t-online.de>
 <87io2q4khh.fsf@dell.be.48ers.dk>
Message-ID: <20160118232515.3208f274@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 18 Jan 2016 22:59:38 +0100, Peter Korsgaard wrote:

>  > +ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
>  > +ALSA_UTILS_CONF_OPTS += --enable-alsaloop
>  > +ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
>  > +ALSA_UTILS_DEPENDENCIES += libsamplerate
>  > +endif
>  > +else
>  > +ALSA_UTILS_CONF_OPTS += --disable-alsaloop
>  > +endif
> 
> While libsamplerate is today only (optionally) used by alsaloop, this
> might change in the future, so I prefer to move this check outside the
> _UTILS_ALSALOOP conditional.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
