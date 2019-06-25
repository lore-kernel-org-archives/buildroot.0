From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jun 2019 00:25:59 +0200
Subject: [Buildroot] [PATCH v4 08/15] package/gcc: switch to gcc 8.x as
 the default
In-Reply-To: <20190623182145.459e0154@windsurf>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-9-giulio.benetti@micronovasrl.com>
 <20190622214410.4bc6022e@windsurf>
 <29b577b0-8c65-7038-929b-ad2828ec7495@gmail.com>
 <20190623182145.459e0154@windsurf>
Message-ID: <1892475d-542b-7c52-26c7-193f9749d347@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/06/2019 18:21, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 23 Jun 2019 00:35:38 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>>> Arnout: do you still think gcc 4.9 is needed at this point ? If it is
>>> the case, should we keep gcc 4.9, but drop gcc 5 and 6 ?  
>>
>> Currently glibc >= 2.29 needs gcc >= 5 on all architectures.
>> So we can only build a toolchain with gcc 4.9 with uClibc and musl.
>> The upcoming release of glibc will require at least gcc 6.2 on all architectures
>> [1].
>>
>> If a toolchain with gcc 4.9 is really needed, it can be build with the 2019.02
>> LTS version.
> 
> So, Peter said for the next LTS (2020.02), we probably want to have
> removed the oldest gcc versions (4.9, 5 and 6, most likely).

 Yes indeed, we can't keep 4.9 around indefinitely, so let's drop it and 5 and 6
as well, leaving just the three most recent ones: 7, 8, 9.


>> Thomas, I have the same question about gdb 7.12.x.
> 
> I think we should also drop it. I was keeping it because it was the
> last gdb version that could be built with a toolchain that doesn't have
> C++11 support. But well, C++11 is there since gcc 4.8, so let's assume
> most sane people have moved their distribution to a version that has
> gcc 4.8 at least.
> 
> So on my side, green light to drop gdb 7.12.

 For gdb, does it actually make sense to keep multiple versions?

 Regards,
 Arnout
