From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 May 2017 23:08:06 +0200
Subject: [Buildroot] [PATCH 2/3] bluez_utils: add missing check
 dependency for test program
In-Reply-To: <20170513202845.GB15337@scaer>
References: <20170513171009.5219-1-romain.naour@gmail.com>
 <20170513171009.5219-2-romain.naour@gmail.com> <20170513202845.GB15337@scaer>
Message-ID: <658015fc-19fc-c271-1c49-515c5fba7e5c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Yegor,

Le 13/05/2017 ? 22:28, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2017-05-13 19:10 +0200, Romain Naour spake thusly:
>> Tests are enabled since this has been introduced [1], so keep
>> them for now.
> 
> Why don't you want to simply disable tests altogehter, especially since
> there is an option for that:
> 
>     --disable-test
> 
> And if we disable tests, then we do not need patch 3/3.

Indeed, I hesitated to do so because tests are explicitly enabled for some
reason. Yegor, do you think that tests can be safely disabled ?

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> bluez_utils needs check tool and check if it's available [2].
>>
>> [1] 06c3e2159686a886e52b2522a47e60c300cfb7f7
>> [2] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/configure.ac?h=4.101#n51
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/bluez_utils/bluez_utils.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
>> index 526804a..256f012 100644
>> --- a/package/bluez_utils/bluez_utils.mk
>> +++ b/package/bluez_utils/bluez_utils.mk
>> @@ -8,7 +8,7 @@ BLUEZ_UTILS_VERSION = 4.101
>>  BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
>>  BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>>  BLUEZ_UTILS_INSTALL_STAGING = YES
>> -BLUEZ_UTILS_DEPENDENCIES = host-pkgconf dbus libglib2
>> +BLUEZ_UTILS_DEPENDENCIES = host-pkgconf check dbus libglib2
>>  BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
>>  BLUEZ_UTILS_AUTORECONF = YES
>>  BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
>> -- 
>> 2.9.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
