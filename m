From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 9 May 2018 09:59:31 -0500
Subject: [Buildroot] [PATCH] xfsprogs: bump to 4.16.1
In-Reply-To: <20180509144929.gl66sxuweg7lytsg@sapphire.tkos.co.il>
References: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180509144929.gl66sxuweg7lytsg@sapphire.tkos.co.il>
Message-ID: <CANQCQpYZDUpXESQeTo2+fyU3zteM7_8go26zX1O+eTaK6fMr6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, May 9, 2018 at 9:49 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Matt,
>
> On Wed, May 09, 2018 at 09:32:03AM -0500, Matt Weber wrote:
>> diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
>> index dffcc28..6411d74 100644
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
>> @@ -20,10 +20,6 @@ XFSPROGS_CONF_OPTS = \
>>       INSTALL_GROUP=root \
>>       --enable-static
>>
>> -ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
>> -XFSPROGS_DEPENDENCIES += libunistring
>> -endif
>> -
>>  XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
>>
>>  $(eval $(autotools-package))
>
> libicu should be an optional dependency instead of libunistring.
>
> Have you tested build with libicu?

Didn't realize it was optional, I'll take a look and retest.

Matt
