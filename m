From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 22:55:51 +0200
Subject: [Buildroot] [PATCH v5 08/34] package/kodi: bump to version
 17.1-Krypton
In-Reply-To: <29sssdx9sb.ln2@ID-313208.user.individual.net>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-9-bernd.kuhls@t-online.de>
 <20170422202457.GJ15086@scaer>
 <29sssdx9sb.ln2@ID-313208.user.individual.net>
Message-ID: <20170422205551.GN15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-22 22:50 +0200, Bernd Kuhls spake thusly:
> Am Sat, 22 Apr 2017 22:24:57 +0200 schrieb Yann E. MORIN:
> 
> >> +KODI_LIBDVDCSS_VERSION = 2f12236
> >> +KODI_LIBDVDNAV_VERSION = 981488f
> >> +KODI_LIBDVDREAD_VERSION = 17d99db
> >> +
> >> +KODI_EXTRA_DOWNLOADS = \
> >> +	https://github.com/xbmc/libdvdcss/archive/
> $(KODI_LIBDVDCSS_VERSION).tar.gz \
> >> +	https://github.com/xbmc/libdvdnav/archive/
> $(KODI_LIBDVDNAV_VERSION).tar.gz \
> >> +	https://github.com/xbmc/libdvdread/archive/
> $(KODI_LIBDVDREAD_VERSION).tar.gz
> >> +
> >> +KODI_CONF_OPTS += \
> >> +	-DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> >> +	-DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> >> +	-DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
> > 
> > So does that mean that the libs are downloaded at build time?
> > 
> > If so, that's unfortnate, but I prefer this situation rather than the
> > big patching of the previous iteration.
> 
> Hi Yann,
> 
> no, because I used KODI_EXTRA_DOWNLOADS the tarballs are downloaded 
> before the build starts, you can verify that with "make kodi-source".

Oh, right, this points to local files. Good! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
