From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 30 Aug 2013 11:26:15 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LVr5La-XtqhEt+d8CjPoxojnjxOFnL0NKkOsumH_mQsLQ@mail.gmail.com>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
 <e8f643690cf9b327505bc17c83d08441@sysmic.org>
 <CAAXf6LVr5La-XtqhEt+d8CjPoxojnjxOFnL0NKkOsumH_mQsLQ@mail.gmail.com>
Message-ID: <221b0cfd36870f56b2d028ffd5d34966@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-08-29 17:12, Thomas De Schampheleire wrote:
> On Thu, Aug 29, 2013 at 3:17 PM, J?r?me Pouiller <jezz@sysmic.org> 
> wrote:
>> On 2013-08-28 09:08, Thomas Petazzoni wrote:
>>>>     x86_64 |               strongswan-5.0.4 | NOK |
>>>> 
>>>> http://autobuild.buildroot.net/results/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/
>>>
>>>
>>> utils/backtrace.c:23:23: fatal error: execinfo.h: No such file or
>>> directory
>>>
>>> uClibc doesn't have execinfo.h by default. Proper testing should be
>>> added in strongswan code. J?r?me, can you have a look at this?
>>
>>
>> I track down this error for some time but I can't reproduce it.
>>
>> There is a test in ./configure that disable inclusion of execinfo.h 
>> if
>> backtrace()
>> is not found. When re-run autobuilder configuration, this check is 
>> correctly
>> executed and execinfo.h is not included.
>>
>> Is anyone else can reproduce it?
>
> I also cannot reproduce it. In my test build HAVE_BACKTRACE is set to
> 1 in config.h, and in the configure output I see:
>
> checking for library containing backtrace... none required
> checking for backtrace... yes
I have "checking for backtrace... no". I think, you can reproduce the 
bug with
this configuration.

On my side, I retry with patch called "Fix build reproducibility with 
Make 3.82"
I sent one hour ago.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
