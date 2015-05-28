From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 May 2015 21:24:10 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_ABI flags to
 configure with --enable-cxx-flags
In-Reply-To: <CAMo8BfKmBgweFoO3JoVv7gwBg1g3ba39ywGaYyH=CtmedSqWCw@mail.gmail.com>
References: <1432625556-14611-1-git-send-email-jcmvbkbc@gmail.com>	<55663AFF.4090107@mind.be>
 <CAMo8BfKmBgweFoO3JoVv7gwBg1g3ba39ywGaYyH=CtmedSqWCw@mail.gmail.com>
Message-ID: <55676B5A.7080902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/15 05:10, Max Filippov wrote:
> On Thu, May 28, 2015 at 12:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05/26/15 09:32, Max Filippov wrote:
>>> libstdc++ is in all regards a normal library, it needs to be built with
>>> TARGET_ABI flags, otherwise linking it with other C++ code may fail.
>>
>>  Then why only do it for xtensa? And why not pass the full TARGET_CFLAGS?
> 
> To minimize the impact of the change: currently it's only problem for xtensa
> and only TARGET_ABI flags are really missing.
> Yes, passing TARGET_CFLAGS works too. And probably it works for other
> architectures, but that needs testing. I can send v2 with these changes.

 I guess we need this patch for 2015.05 then and TARGET_CFLAGS for -next.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
