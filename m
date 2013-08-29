From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Thu, 29 Aug 2013 15:17:31 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828090812.43a7f849@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
Message-ID: <e8f643690cf9b327505bc17c83d08441@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 2013-08-28 09:08, Thomas Petazzoni wrote:
[...]
>>     x86_64 |               strongswan-5.0.4 | NOK | 
>> http://autobuild.buildroot.net/results/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/
>
> utils/backtrace.c:23:23: fatal error: execinfo.h: No such file or 
> directory
>
> uClibc doesn't have execinfo.h by default. Proper testing should be
> added in strongswan code. J?r?me, can you have a look at this?

I track down this error for some time but I can't reproduce it.

There is a test in ./configure that disable inclusion of execinfo.h if 
backtrace()
is not found. When re-run autobuilder configuration, this check is 
correctly
executed and execinfo.h is not included.

Is anyone else can reproduce it?

[...]


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
