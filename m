From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Sep 2019 21:55:03 +0200
Subject: [Buildroot] [PATCH v6 09/25] package/kodi: bump to version
 18.4-Leia
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-10-bernd.kuhls@t-online.de>
 <c40f0485-9441-c34f-ea65-c7f256f3f8ef@mind.be>
Message-ID: <nhkn5gxaef.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 21 Sep 2019 23:03:39 +0200 schrieb Arnout Vandecappelle:

>  Actually, we might want to add a second github helper that does the 
full name, e.g.
> 
> github-full = $(call github,$(1),$(2),$(3))/$(4)-$(3).tar.gz
> 
>> +# 1.4.2-Leia-Beta-5
>> +KODI_LIBDVDCSS_VERSION = e646b950095589e74a2c08cf0c34b758c669aa75
> 
>  So, why not use the tag? Seems much more descriptive than a random 
commit...
> 
>> +# 6.0.0-Leia-Alpha-3
>> +KODI_LIBDVDNAV_VERSION = 9277007ce2263b908e9ce3091cc31b3dd87c351c
>> +# 6.0.0-Leia-Alpha-3
>> +KODI_LIBDVDREAD_VERSION = bd6b329f0137ab6a9f779a28dd96f04713735e17
>>  KODI_EXTRA_DOWNLOADS += \
>>  	https://github.com/xbmc/libdvdcss/archive/$
(KODI_LIBDVDCSS_VERSION).tar.gz \
>>  	https://github.com/xbmc/libdvdnav/archive/$
(KODI_LIBDVDNAV_VERSION).tar.gz \
>>  	https://github.com/xbmc/libdvdread/archive/$
(KODI_LIBDVDREAD_VERSION).tar.gz

Hi Arnout,

to use tags we need a second github helper because 

https://github.com/xbmc/libdvdread/archive/6.0.0-Leia-Alpha-3.tar.gz
https://github.com/xbmc/libdvdnav/archive/6.0.0-Leia-Alpha-3.tar.gz

will overwrite each other in DL_DIR/kodi/ so for the time being I will 
not change the patch.

Regards, Bernd
