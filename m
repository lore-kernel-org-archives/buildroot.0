From: Martin Bark <martin@barkynet.com>
Date: Tue, 18 Feb 2014 15:43:19 +0000
Subject: [Buildroot] [PATCH v5 5/5] xbmc: new package
In-Reply-To: <CAGduivznzC=-rK3hspNjykR6a5MTpTR2oCWW=M=tN3jgsq13vA@mail.gmail.com>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392332394-27935-6-git-send-email-maxime.hadjinlian@gmail.com>
 <52FE9FDE.4090102@barkynet.com>
 <CAGduivznzC=-rK3hspNjykR6a5MTpTR2oCWW=M=tN3jgsq13vA@mail.gmail.com>
Message-ID: <53037F97.7040906@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

Sorry for the late replay

On 14/02/14 23:51, Maxime Hadjinlian wrote:

-- snip --

>>
>>
>>> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
>>> new file mode 100644
>>> index 0000000..db43a9f
>>> --- /dev/null
>>> +++ b/package/xbmc/xbmc.mk
>>> @@ -0,0 +1,175 @@
>>>
>>> +################################################################################
>>> +#
>>> +# xbmc
>>> +#
>>>
>>> +################################################################################
>>> +
>>> +XBMC_VERSION = 12.3-Frodo
>>> +XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
>>> +XBMC_LICENSE = GPLv2
>>> +XBMC_LICENSE_FILES = LICENSE.GPL
>>> +XBMC_DEPENDENCIES = host-lzo host-sdl_image host-swig
>>
>>
>> I think you need to add host-gperf, i had to add this for xmbc to compile.
> host-gperf ? I never needed that, why should it be needed ?

I just verified and xmbc does fails to build for me because i'm missing 
gpref.  I checked and the configure script tests for gpref and errors if 
it's missing.  The machine i'm building on does not have gperf 
installed.  Either adding host-gpref or patching configure.in to remove 
the tests for gpref fixed this issue.  I think probably patching 
configure.in is a better solution.

Thanks
