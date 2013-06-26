From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 26 Jun 2013 22:22:37 +0200
Subject: [Buildroot] [PATCH 1/1] pv: bump to version 1.4.6
In-Reply-To: <51CB48B5.7070308@mind.be>
References: <1372276230-15075-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <51CB48B5.7070308@mind.be>
Message-ID: <51CB4D8D.2040202@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your review.

> On 26/06/13 21:50, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> ---
>>   .../{pv-1.2.0-fixld.patch => pv-0001-fixld.patch}  |    9 ++++-----
>>   package/pv/pv.mk                                   |    4 ++--
>>   2 files changed, 6 insertions(+), 7 deletions(-)
>>   rename package/pv/{pv-1.2.0-fixld.patch => pv-0001-fixld.patch} (66%)
>>
>> diff --git a/package/pv/pv-1.2.0-fixld.patch 
>> b/package/pv/pv-0001-fixld.patch
>> similarity index 66%
>> rename from package/pv/pv-1.2.0-fixld.patch
>> rename to package/pv/pv-0001-fixld.patch
>> index 9df279d..2598a9b 100644
>> --- a/package/pv/pv-1.2.0-fixld.patch
>> +++ b/package/pv/pv-0001-fixld.patch
>> @@ -6,15 +6,14 @@ a cross-compiler toolchain.
>>   The fix takes the CC variable and changes the 'gcc' extension to 'ld'.
>>
>>   Signed-off-by: Roeland Van Praet <roelvp@mind.be>
>> +Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>>   ---
>> -diff -ruN a/autoconf/make/vars.mk b/autoconf/make/vars.mk
>> ---- a/autoconf/make/vars.mk    2010-03-11 00:43:19.000000000 +0100
>> -+++ b/autoconf/make/vars.mk    2011-10-06 15:47:18.000000000 +0200
>> -@@ -30,7 +30,7 @@
>> +--- a/autoconf/make/vars.mk    2012-06-05 23:55:23.000000000 +0200
>> ++++ b/autoconf/make/vars.mk    2013-06-26 17:47:16.000000000 +0200
>> +@@ -30,6 +30,7 @@ INSTOBJEXT = @INSTOBJEXT@
>>    @SET_MAKE@
>>    SHELL = /bin/sh
>>    CC = @CC@
>> --LD = ld
>
>  If the new version's build system doesn't define the LD variable 
> anymore, then this patch is probably not needed anymore either.
>
>  Can you try to just remove the patch?
Without this patch build doesn't work.

Regards,
Jerzy

>
>  Regards,
>  Arnout
>
>
>>   +LD = $(CC:gcc=ld)
>>    DO_GZIP = @DO_GZIP@
>>    INSTALL = @INSTALL@
>> diff --git a/package/pv/pv.mk b/package/pv/pv.mk
>> index 1aa95f6..3717977 100644
>> --- a/package/pv/pv.mk
>> +++ b/package/pv/pv.mk
>> @@ -4,8 +4,8 @@
>>   #
>> ################################################################################
>>
>> -PV_VERSION = 1.2.0
>> +PV_VERSION = 1.4.6
>>   PV_SOURCE = pv-$(PV_VERSION).tar.bz2
>> -PV_SITE = http://pipeviewer.googlecode.com/files
>> +PV_SITE = http://www.ivarch.com/programs/sources
>>
>>   $(eval $(autotools-package))
>>
>
>
