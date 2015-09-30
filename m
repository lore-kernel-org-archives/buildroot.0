From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Sep 2015 08:52:14 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "setools: fix race condition"
In-Reply-To: <20150929173206.11f589b7@free-electrons.com>
References: <1443539310-55883-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150929173206.11f589b7@free-electrons.com>
Message-ID: <560B94AE.3020009@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 29/09/15 16:32, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Tue, 29 Sep 2015 16:08:29 +0100, Vicente Olivert Riera wrote:
>> This reverts commit 1ac68fe2c9b4cea91c7a30429ebf75279ede8e70.
>>
>> Further investigations revealed that the problem wasn't a race condition
>> but the lack of flex package in the host machine:
>>
>>    https://github.com/TresysTechnology/setools3/issues/5#issuecomment-144048612
>
> Missing SoB line here :-)

Shame on me :-( I should have passed the '-s' option to 'git revert'.

I have sent a v2.

Thanks,

Vincent.

>
>> ---
>>   package/setools/setools.mk |    4 ----
>>   1 files changed, 0 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
>> index 71301c7..a2bfd42 100644
>> --- a/package/setools/setools.mk
>> +++ b/package/setools/setools.mk
>> @@ -12,10 +12,6 @@ SETOOLS_INSTALL_STAGING = YES
>>   SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
>>   SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
>>
>> -# Race condition reported upstream:
>> -# https://github.com/TresysTechnology/setools3/issues/5
>> -SETOOLS_MAKE = $(MAKE1)
>> -
>>   # configure.ac is patched by the cross compile patch,
>>   # so autoreconf is necessary
>>   SETOOLS_AUTORECONF = YES
>
> Thomas
>
