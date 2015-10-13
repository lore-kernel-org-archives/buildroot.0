From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Tue, 13 Oct 2015 09:06:14 -0300
Subject: [Buildroot] [PATCH v2 1/2] axfsutils: add new package
In-Reply-To: <5612C3C9.8000805@mind.be>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-2-git-send-email-ariel@vanguardiasur.com.ar>
 <5612C3C9.8000805@mind.be>
Message-ID: <561CF3B6.5020008@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Thanks for your response,

El 05/10/15 a las 15:39, Arnout Vandecappelle escribi?:
> On 05-10-15 17:55, Ariel D'Alessandro wrote:
>> Tools for building AXFS Filesystem.
>>
>> The Advanced XIP File System is a Linux kernel filesystem driver that enables
>> files to be executed directly from flash or ROM memory rather than being copied
>> into RAM.
> 
>  Commit messages are normally wrapped at 72 columns.

Right, will change that.

> 
>>
[snip]
>>
>> diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
>> new file mode 100644
>> index 0000000..ce5b892
>> --- /dev/null
>> +++ b/package/axfsutils/axfsutils.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# axfsutils
>> +#
>> +################################################################################
>> +
>> +AXFSUTILS_VERSION = f26ae785e33df76f658b71ef2cfbc7f511ff875d
>> +AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
>> +AXFSUTILS_LICENSE = GPLv2
> 
>  I verified that it's indeed v2 only.
> 
>> +AXFSUTILS_LICENSE_FILES = COPYING
> 
>  It's actually mkfs.axfs-legacy/COPYING.

Woops, my bad! I'll fix that.

> 
> 
>  Looking at the source, it seems that you have to add host-zlib as a dependency.

I'll check this.

> 
>> +
>> +define HOST_AXFSUTILS_BUILD_CMDS
>> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mkfs.axfs-legacy
> 
>  It would be add to add an explanation why you use the legacy one: "The 'new'
> mkfs.axfs requires GNUstep which is not a buildroot prerequisite, and the
> 'legacy' one works just as well."
> 
>  Note that comments should be put outside of the CMDS block.

OK. I'll add this and send a new patchset v3.

Thanks!

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
