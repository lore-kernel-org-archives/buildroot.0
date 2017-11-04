From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 21:35:25 +0100
Subject: [Buildroot] [PATCH] package/collectd: Specify correct FP layout
 for PowerPC
In-Reply-To: <CAHQ1cqEGDEcCAJ2roAXy6jgzYk2nNaVc8MVCSLBQ--Lw9AEwtQ@mail.gmail.com>
References: <20171031003539.919-1-andrew.smirnov@gmail.com>
 <20171101104256.4da2b465@windsurf>
 <CAHQ1cqEGDEcCAJ2roAXy6jgzYk2nNaVc8MVCSLBQ--Lw9AEwtQ@mail.gmail.com>
Message-ID: <42995d92-330a-ed8f-9da6-1fc90543dd13@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 00:24, Andrey Smirnov wrote:
>> However, there is a third FP layout called "intswap", and I'm not sure
>> in which situations it should be used. Some additional investigation of
>> collectd configure.ac script is probably needed to understand the
>> AC_RUN_IFELSE() tests it does to figure out what the FP layout is when
>> doing a native build.
>>
> I looked at that part of config.ac when I was debugging the problem
> and AFACT all "intswap()" does is swapping upper and lower 32-bits of
> a 64-bit word. I can't think of an architecture that would require
> such a transformation and commit that introduced that check in
> collectd didn't have any helpful hints either. Can we limit the scope
> of this fix to big vs. little endian the way you suggested and leave
> the "intswap" case out?

 That would be old ARM FP which had mixed-endian doubles? I can't find a good
reference to it, just [1]. I remember from years ago that on ARM I had to do
some weird word-swapping when converting doubles to/from network byte order.

 Regards,
 Arnout


[1] https://en.wikipedia.org/wiki/Endianness#Floating_point

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
