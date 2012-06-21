From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jun 2012 08:26:20 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-06-20
In-Reply-To: <20120621113207.616a649e@skate>
References: <20120621063115.B05E852CEBE@lolut.humanoidz.org>
 <87ipelqccc.fsf@macbook.be.48ers.dk> <20120621113207.616a649e@skate>
Message-ID: <452b71440dc2b296d984b0765d2bdffc@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-06-21 06:32, Thomas Petazzoni wrote:

> Le Thu, 21 Jun 2012 10:49:07 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>>  Thomas> Status         : NOK
>>  Thomas> Failure reason : ffmpeg-0.8.11
>>  Thomas> Architecture   : arm
>>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build 
>> server)
>>  Thomas> Submitted at   : 2012-06-20 20:57:51
>>  Thomas> Git commit ID  : 
>> http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>>  Thomas> End of log     : 
>> http://autobuild.buildroot.net/results/3270ce7b816f7d141327a09e9c4273fd001827fb/build-end.log
>>
>> ARM/thumb mismatch?
>
> I don't know, maybe.

Not really, check back in the log, it's selecting ARMv6:

ARMv5TE enabled           no
ARMv6 enabled             yes
ARMv6T2 enabled           yes
ARM VFP enabled           yes
IWMMXT enabled            no
NEON enabled              no

My guess is that's it's doing build testing of the ISA and some 
external toolchains default to something more than "generic".
So probably just make the logic more aggresive for ffmpeg's configure 
parameters (just enable/disable instead of assuming it's disabled by 
default which doesn't seem to be the case).
Regards.
