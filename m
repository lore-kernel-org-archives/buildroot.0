From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 9 May 2018 11:25:31 -0500
Subject: [Buildroot] [PATCH v2] xfsprogs: bump to 4.16.1
In-Reply-To: <20180509161401.juokwpkwq2cdqyiy@sapphire.tkos.co.il>
References: <1525882018-28094-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180509161401.juokwpkwq2cdqyiy@sapphire.tkos.co.il>
Message-ID: <CANQCQpYTO+A-AbY7_7tz3ednn1d6NwX9yZ=yZebze7sEih6ejQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, May 9, 2018 at 11:14 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Matt,
>
> On Wed, May 09, 2018 at 11:06:58AM -0500, Matt Weber wrote:
>> diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
>> index dffcc28..7f72f76 100644
>> --- a/package/xfsprogs/xfsprogs.mk
>> +++ b/package/xfsprogs/xfsprogs.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -XFSPROGS_VERSION = 4.15.1
>> +XFSPROGS_VERSION = 4.16.1
>>  XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
>>  XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
>>  XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
>> @@ -20,8 +20,8 @@ XFSPROGS_CONF_OPTS = \
>>       INSTALL_GROUP=root \
>>       --enable-static
>>
>> -ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
>> -XFSPROGS_DEPENDENCIES += libunistring
>> +ifeq ($(BR2_PACKAGE_ICU),y)
>> +XFSPROGS_DEPENDENCIES += icu
>
> You should also add --{enable,disable}-libicu to XFSPROGS_CONF_OPTS as
> appropriate.
>

I noticed the xfsprogs package is set to "Enable Unicode name scanning
(libicu) default=probe", should we explicitly still do a
enable/disable as the probe lines up with our Buildroot xfsprogs.mk
dynamically enabling the dependency on icu?

If I do explicitly do an enable/disable.  Do you know if a
--enable-libicu=yes/no is equivalent to the --{enable,disable}-libicu?

Matt
