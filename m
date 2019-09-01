From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 01 Sep 2019 06:51:57 +0300
Subject: [Buildroot] [PATCH] package/libnss: security bump to version
 3.46
In-Reply-To: <36a5f792-cb9d-0873-6efb-76a36e2267d6@micronovasrl.com>
References: <20190831204033.93610-1-giulio.benetti@micronovasrl.com>
 <36a5f792-cb9d-0873-6efb-76a36e2267d6@micronovasrl.com>
Message-ID: <87ef10brmq.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

On Sat, Aug 31 2019, Giulio Benetti wrote:
> Subject should be: "package/libnss: bump to version 3.46" without
> 'security'.

This bump fixes CVE-2019-11727 and CVE-2019-11719. The commit log should
mention that though.

baruch

> Il 31/08/2019 22:40, Giulio Benetti ha scritto:
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/libnss/libnss.hash | 2 +-
>>   package/libnss/libnss.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
>> index 1d600f14ef..678f39b090 100644
>> --- a/package/libnss/libnss.hash
>> +++ b/package/libnss/libnss.hash
>> @@ -1,4 +1,4 @@
>>   # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_42_1_RTM/src/SHA256SUMS
>> -sha256	087db37d38fd49dfd584dd2a8b5baa7fc88de7c9bd97c0c2d5be4abcafc61fc6  nss-3.42.1.tar.gz
>> +sha256	6b699649d285602ba258a4b0957cb841eafc94eff5735a9da8da0adbb9a10cef  nss-3.46.tar.gz
>>   # Locally calculated
>>   sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
>> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
>> index 34e9d41968..776f232ad5 100644
>> --- a/package/libnss/libnss.mk
>> +++ b/package/libnss/libnss.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -LIBNSS_VERSION = 3.42.1
>> +LIBNSS_VERSION = 3.46
>>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>>   LIBNSS_DISTDIR = dist

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
