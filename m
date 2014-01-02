From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 02 Jan 2014 16:30:12 +0100
Subject: [Buildroot] [PATCH 1/1] mpd: Fix broken download URL
In-Reply-To: <20140102151829.197de141@skate>
References: <BLU0-SMTP1005BFDF4C4664AA662BD57D9C80@phx.gbl>
 <20140102151829.197de141@skate>
Message-ID: <52C58604.3010009@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Bernd, Thomas,

> Dear Bernd Kuhls,
>
> On Wed, 1 Jan 2014 20:35:10 +0100, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
>> ---
>>   package/mpd/mpd.mk |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
>> index d8f344f..c9fc714 100644
>> --- a/package/mpd/mpd.mk
>> +++ b/package/mpd/mpd.mk
>> @@ -6,7 +6,7 @@
>>   
>>   MPD_VERSION = 0.17.6
>>   MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>> -MPD_SITE = http://www.musicpd.org/download/mpd/stable
>> +MPD_SITE = http://www.musicpd.org/download/mpd/0.17
> Thanks, but I believe we should use the MPD_MAJOR_VERSION scheme that
> Jerzy Grzegorek has started to introduce:
>
> MPD_MAJOR_VERSION = 0.17
> MPD_VERSION = $(MPD_MAJOR_VERSION).6
> MPD_SITE = http://www.musicpd.org/downloads/mpd/$(MPD_MAJOR_VERSION)

<PKG>_VERSION_MAJOR
In this case MPD_VERSION_MAJOR

Regards,
Jerzy

>
> Could you submit an updated version of your patch that takes into
> account this suggestion? Thanks!
>
> Best regards,
>
> Thomas
