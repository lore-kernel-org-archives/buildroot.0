From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Sep 2016 12:21:02 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging
 dir
In-Reply-To: <3aa07d73-d34f-0070-3020-a3786e5a82ae@free.fr>
References: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
 <20160924161810.09ee4fa5@free-electrons.com>
 <3aa07d73-d34f-0070-3020-a3786e5a82ae@free.fr>
Message-ID: <6fa984a3-83e4-3ea5-8841-88b2db197ebc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-09-16 10:56, Julien Boibessot wrote:
> Hello,
> 
> Arnout, Thomas,
> thanks for reviewing.
> 
> On 24/09/2016 16:18, Thomas Petazzoni wrote:
[snip]
>>     This reverts commit ff673f9a22b1467878f1a117f2c6198e9683d5c7, as the
>>     modified i2c-dev.h from i2c-tools has some definitions that conflict
>>     with the i2c.h from the kernel headers. This means that a userspace
>>     program or library that includes both will fail to build, as is the
>>     case with libsoc.
>>     
>>     Fixes:
>>     
>>       http://autobuild.buildroot.org/results/1f4/1f451a338487a2a3c8a8f9b18540d41b90ee5aac/
>>     
>>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> So, if we are going to merge the same patch again, I'd like to be sure
>> that we won't fall into the exact same problems we had the previous
>> time. Could you check this?
> 
> Sorry for having missed that one ! Sadly, the same problem will occur
> with my patch.
> I have currently no idea how to solve that and still trying to figure
> out how it can works on debian systems with libi2c-dev package installed.
> So meanwhile you can forget about my patch.

 I guess Debian doesn't have packages that include both i2c.h and i2c-dev.h.
libsoc, for example, doesn't exist in Debian.

 I guess the solution would be for i2c-tools to #include or #include_next the
relevant kernel headers, instead of redefining. Or to have both i2c.h and
i2c-dev.h so that both kernel headers end up being overwritten.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
