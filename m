From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Apr 2017 22:50:10 +0200
Subject: [Buildroot] [PATCH v5 08/34] package/kodi: bump to version
	17.1-Krypton
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-9-bernd.kuhls@t-online.de>
 <20170422202457.GJ15086@scaer>
Message-ID: <29sssdx9sb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 22 Apr 2017 22:24:57 +0200 schrieb Yann E. MORIN:

>> +KODI_LIBDVDCSS_VERSION = 2f12236
>> +KODI_LIBDVDNAV_VERSION = 981488f
>> +KODI_LIBDVDREAD_VERSION = 17d99db
>> +
>> +KODI_EXTRA_DOWNLOADS = \
>> +	https://github.com/xbmc/libdvdcss/archive/
$(KODI_LIBDVDCSS_VERSION).tar.gz \
>> +	https://github.com/xbmc/libdvdnav/archive/
$(KODI_LIBDVDNAV_VERSION).tar.gz \
>> +	https://github.com/xbmc/libdvdread/archive/
$(KODI_LIBDVDREAD_VERSION).tar.gz
>> +
>> +KODI_CONF_OPTS += \
>> +	-DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
>> +	-DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
>> +	-DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
> 
> So does that mean that the libs are downloaded at build time?
> 
> If so, that's unfortnate, but I prefer this situation rather than the
> big patching of the previous iteration.

Hi Yann,

no, because I used KODI_EXTRA_DOWNLOADS the tarballs are downloaded 
before the build starts, you can verify that with "make kodi-source".

Regards, Bernd
