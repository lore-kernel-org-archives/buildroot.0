From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 24 Sep 2019 09:38:00 +0200
Subject: [Buildroot] [PATCH] exfat,
 exfat-utils: fix the installation path of the helper utilities
In-Reply-To: <CAJ4jsadgAdMk9kcqWws8Mcw471GK60ze+ixTQDmrObdMcYRrBA@mail.gmail.com>
References: <466c3d76-7b83-90e6-27f2-aa78f70d47aa@grandegger.com>
 <8aa9f55b-bf31-fd19-74e4-27adbf9b1fca@mind.be>
 <CAJ4jsadgAdMk9kcqWws8Mcw471GK60ze+ixTQDmrObdMcYRrBA@mail.gmail.com>
Message-ID: <335eb8fe-ddbe-bf43-26ab-0888276e9889@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 23.09.19 um 00:34 schrieb Carlos Santos:
> On Sat, Sep 21, 2019 at 8:40 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 12/09/2019 09:17, Wolfgang Grandegger wrote:
>>> "mount" from the "util-linux" package does expect the helper utilities
>>> in "/sbin" and not "/usr/sbin".
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> ---
>>>  package/exfat-utils/exfat-utils.mk | 2 ++
>>>  package/exfat/exfat.mk             | 2 ++
>>>  2 files changed, 4 insertions(+)
>>>
>>> diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
>>> index 62cd471..d22d5c9 100644
>>> --- a/package/exfat-utils/exfat-utils.mk
>>> +++ b/package/exfat-utils/exfat-utils.mk
>>> @@ -9,4 +9,6 @@ EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTI
>>>  EXFAT_UTILS_LICENSE = GPL-3.0+
>>>  EXFAT_UTILS_LICENSE_FILES = COPYING
>>>
>>> +EXFAT_UTILS_CONF_OPTS += --bindir=/bin --sbindir=/sbin --libdir=/lib
>>> +
>>>  $(eval $(autotools-package))
>>> diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
>>> index b52b197..0d4f1c9 100644
>>> --- a/package/exfat/exfat.mk
>>> +++ b/package/exfat/exfat.mk
>>> @@ -12,4 +12,6 @@ EXFAT_LICENSE = GPL-3.0+
>>>  EXFAT_LICENSE_FILES = COPYING
>>>  EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
>>>
>>> +EXFAT_CONF_OPTS += --bindir=/bin --sbindir=/sbin --libdir=/lib
>>
>>  Why not just set --prefix=/ ?
>>
>>  Regards,
>>  Arnout
>>
>>> +
>>>  $(eval $(autotools-package))
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> No, because --prefix=/usr is passed by package/pkg-autotools.mk first
> and the additional --prefix=/ is discarded.

Hm, "--prefix=/" works for me!. I'm going to send v2 then.

Wolfgang
