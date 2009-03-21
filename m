From: Maxim Grigoriev <maxim@tensilica.com>
Date: Sat, 21 Mar 2009 10:45:30 -0700
Subject: [Buildroot] ltp-testsuite package qustion
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090147DD12@mi8nycmail19.Mi8.com>
References: <49C441BF.3070005@tensilica.com>
	<BD79186B4FD85F4B8E60E381CAEE19090147DD12@mi8nycmail19.Mi8.com>
Message-ID: <49C527BA.9020404@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your feedback.

>> In ./package/ltp-testsuite/ltp-testsuite.mk:
>> 
>> - LTP_TESTSUITE_VERSION:=20070228
>> + LTP_TESTSUITE_VERSION:=20090228

That's what I did. Then, I found out that I have to redo the patches.

Does it mean nobody tried recent LTP tests ?

Thanks,
-- Maxim


H Hartley Sweeten wrote:
> On Friday, March 20, 2009 6:24 PM, Maxim Grigoriev wrote:
>   
>> Hello everybody,
>>
>> Can somebody, please, tell me how I can change a version of 
>> .../package/ltp-testsuite  ?
>>
>> Is 20070228 a default ?
>> It seems to be hard-coded. And, ltp-testsuite patches do not apply
>> to a newer version.
>>
>> On the  http://ltp.sourceforge.net/, the latest stable version is 
>> claimed to be
>>
>>              ltp-full-20090228.tgz
>>
>>     
>
> In ./package/ltp-testsuite/ltp-testsuite.mk:
>
> - LTP_TESTSUITE_VERSION:=20070228
> + LTP_TESTSUITE_VERSION:=20090228
>
>   
>> A Two-years old version does not work quite well with recent
>> versions of tools and kernel / kernel headers.
>>
>> One of the issues I observe is an undefined macro OPEN_MAX, which
>> was removed from limits.h. It's now a variable, which can be obtained,
>> say, by
>>
>>              sysconf (_SC_OPEN_MAX).
>>
>> I'm hoping that switching to a newer version of LTP would fix this
>> problem.
>>
>> Any help on this will be highly appreciated.
>>     
>
> Regards,
> Hartley
>
>   
