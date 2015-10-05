From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Mon, 5 Oct 2015 08:03:51 -0300
Subject: [Buildroot] [PATCH 1/2] axfsutils: add new package
In-Reply-To: <20151002215737.GA4284@free.fr>
References: <1443796641-16056-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1443796641-16056-2-git-send-email-ariel@vanguardiasur.com.ar>
 <20151002215737.GA4284@free.fr>
Message-ID: <56125917.7070308@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

El 02/10/15 a las 18:57, Yann E. MORIN escribi?:
> Ariel, All,
> 
> On 2015-10-02 11:37 -0300, Ariel D'Alessandro spake thusly:
>> Tools for building AXFS Filesystem.
>>
>> The Advanced XIP File System is a Linux kernel filesystem driver that enables
>> files to be executed directly from flash or ROM memory rather than being copied
>> into RAM.
>>
>> Source:
>> 	https://github.com/jaredeh/axfs
>>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
>>  package/axfsutils/axfsutils.mk | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 package/axfsutils/axfsutils.mk
>>
>> diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
>> new file mode 100644
>> index 0000000..ef8d471
>> --- /dev/null
>> +++ b/package/axfsutils/axfsutils.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# axfsutils
>> +#
>> +################################################################################
>> +
>> +AXFSUTILS_VERSION = f26ae785e33df76f658b71ef2cfbc7f511ff875d
>> +AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
>> +AXFSUTILS_LICENSE = GPLv2
>> +AXFSUTILS_LICENSE_FILES = COPYING
>> +
>> +define HOST_AXFSUTILS_BUILD_CMDS
>> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mkfs.axfs-legacy
>> +endef
>> +
>> +define HOST_AXFSUTILS_INSTALL_CMDS
>> +	cp $(@D)/mkfs.axfs-legacy/mkfs.axfs $(HOST_DIR)/usr/bin/
>> +endef
>> +
>> +$(eval $(generic-package))
> 
> Since you do not add a Config.in that provides the corresponding option
> BR2_PACKAGE_AXFSUTILS for this package, it will never be buildable for
> the target.
> 
> So, either you provide a Config.in that adds BR2_PACKAGE_AXFSUTILS (like
> is done for e2fsprogs, for example), or you do not add a call to $(generic-package)

You're right. Wrong call to $(generic-package). I'll remove it and
submit patchset v2.

Thanks!

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
