From: William Wagner <will_wagner@carallon.com>
Date: Fri, 26 Mar 2010 12:17:51 +0000
Subject: [Buildroot] [Patch]matchbox: convert to autotools
In-Reply-To: <20100325234920.5dae5e04@surf>
References: <4BA7C9D6.8060208@carallon.com> <20100325234920.5dae5e04@surf>
Message-ID: <4BACA5EF.3000400@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/2010 22:49, Thomas Petazzoni wrote:
> Hello William,
>
> Thanks a lot for doing this work! Next time, to ease the review process,
> could you send your patch inline ? git send-email will do it for you.
>    

Will give git send-email a try. have to resolve some dependency problems 
on my debian box before I can install it, but I'm sure it shouldn't be 
too hard.

> A few minor comments below :
>
> On Mon, 22 Mar 2010 19:49:42 +0000
> William Wagner<will_wagner@carallon.com>  wrote:
>
>    
>> +++ b/package/matchbox/matchbox-common/matchbox-common.mk
>> @@ -0,0 +1,16 @@
>> +#############################################################
>> +#
>> +# MatchBox Common
>> +#
>> +#############################################################
>> +
>> +MATCHBOX_COMMON_VERSION = 0.9.1
>> +MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
>> +MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
>> +MATCHBOX_COMMON_AUTORECONF = NO
>>      
> Unneeded, this is the default value.
>    

Wasn't aware that was the default. Will update accordingly and resubmit 
patch.

>> +++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
>> @@ -0,0 +1,59 @@
>> +#############################################################
>> +#
>> +# MatchBox LIB
>> +#
>> +#############################################################
>>      
> Is it expected that this package isn't associated with any
> configuration option ?
>
>    
I have just copied how matchbox worked before. By adding the window 
manager the library is automatically build, so it's not visible in the 
config menu. Not difficult to change, nut the library is very unlikely 
to be of use on it's own.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
