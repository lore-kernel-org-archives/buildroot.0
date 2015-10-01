From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 01 Oct 2015 22:28:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-stalker: Needs
	jsoncpp
References: <1443730437-12443-1-git-send-email-bernd.kuhls@t-online.de>
 <20151001202438.GE3337@tarshish>
Message-ID: <XnsA526E49B29BD5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Baruch Siach <baruch@tkos.co.il> wrote in 
news:20151001202438.GE3337 at tarshish:

> Hi Benrd,
> 
> On Thu, Oct 01, 2015 at 10:13:57PM +0200, Bernd Kuhls wrote:
>> diff --git a/package/kodi-pvr-stalker/Config.in 
>> b/package/kodi-pvr-stalker/Config.in
>> index b327fd8..0e6143a 100644
>> --- a/package/kodi-pvr-stalker/Config.in
>> +++ b/package/kodi-pvr-stalker/Config.in
>> @@ -1,7 +1,12 @@
>>  config BR2_PACKAGE_KODI_PVR_STALKER
>>       bool "kodi-pvr-stalker"
>> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
> 
> Also BR2_INSTALL_LIBSTDCPP.

Hi Baruch,

imho this is not necessary, BR2_PACKAGE_KODI_PVR_STALKER can only be selected 
if BR2_PACKAGE_KODI is true and BR2_PACKAGE_KODI already depends on BR2
_INSTALL_LIBSTDCPP.

Regards, Bernd
