From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 1 Apr 2019 00:18:07 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: fix
 gettext-tiny-legal-info build failure
In-Reply-To: <20190331214043.GE2587@scaer>
References: <20190331211240.104056-1-giulio.benetti@micronovasrl.com>
 <20190331214043.GE2587@scaer>
Message-ID: <0414dfcf-0d5b-0cc3-581b-c188834eb8a8@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 31/03/2019 23:40, Yann E. MORIN ha scritto:
> Giilio, All,
> 
> On 2019-03-31 23:12 +0200, Giulio Benetti spake thusly:
>> gettext-tiny doesn't contain extra/COPYING file.
>>
>> Remove extra/COPYING from package recipe and package hash.
> 
> No, that is not correct, because the host variant does have both.

This is why there is "(extra gettext)" appended to GETTEXT_TINY_LICENSE.
One thing learnt more,
thank you!

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

> Im just sending a patch now.
> 
> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>> http://autobuild.buildroot.net/results/dec/deca5e6c66ffb898a29f50678d8213f87cc54682/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/gettext-tiny/gettext-tiny.hash | 1 -
>>   package/gettext-tiny/gettext-tiny.mk   | 2 +-
>>   2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
>> index 672e964186..dbcc4d2a8f 100644
>> --- a/package/gettext-tiny/gettext-tiny.hash
>> +++ b/package/gettext-tiny/gettext-tiny.hash
>> @@ -1,7 +1,6 @@
>>   # Locally Computed:
>>   sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-v0.3.1.tar.gz
>>   sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
>> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
>>   # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
>>   md5  df3f5690eaa30fd228537b00cb7b7590         gettext-0.19.8.1.tar.xz
>>   sha1 e0fe90ede22f7f16bbde7bdea791a835f2773fc9 gettext-0.19.8.1.tar.xz
>> diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
>> index c9052d0d7c..d213fe7398 100644
>> --- a/package/gettext-tiny/gettext-tiny.mk
>> +++ b/package/gettext-tiny/gettext-tiny.mk
>> @@ -8,7 +8,7 @@ GETTEXT_TINY_VERSION = v0.3.1
>>   GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
>>   GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
>>   GETTEXT_TINY_INSTALL_STAGING = YES
>> -GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
>> +GETTEXT_TINY_LICENSE_FILES = LICENSE
>>   
>>   GETTEXT_TINY_PROVIDES = gettext
>>   
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
