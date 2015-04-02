From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 Apr 2015 23:53:25 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/download: be more aggressive
 on missing hashes (branch yem/dl-hash-2)
In-Reply-To: <551DB5F1.60700@mind.be>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
 <20150401220801.19f6ed2f@free-electrons.com> <20150401205235.GC4235@free.fr>
 <551DB5F1.60700@mind.be>
Message-ID: <551DBA55.2050507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/15 23:34, Arnout Vandecappelle wrote:
> On 01/04/15 22:52, Yann E. MORIN wrote:
>> Thomas, All,
>>
>> On 2015-04-01 22:08 +0200, Thomas Petazzoni spake thusly:
>>> On Wed,  1 Apr 2015 00:15:03 +0200, Yann E. MORIN wrote:
>>>> This series makes hashes mandatory when a .hash file exists.
>> [--SNIP--]
>>> I applied this and was going to push it, but I believe there's still a
>>> problem.
>>>
>>> If I change strace.hash so that there is no hash matching the tarball
>>> name of strace, then I get two times the error:
>>>
>>> $ make strace-extract
>>> ERROR: No hash found for strace-4.10.tar.xz
>>> ERROR: No hash found for strace-4.10.tar.xz
>>> package/pkg-generic.mk:73: recipe for target '/home/thomas/projets/buildroot/output/build/strace-4.10/.stamp_downloaded' failed
>>>
>>> I haven't looked too deeply, but I believe it's because check-hash
>>> returns 3, so dl-wrapper exits with error code 1, which means that the
>>> pkg-download.mk logic concludes that the download from the upstream
>>> location has failed, so it retries with sources.buildroot.net, and the
>>> same thing happens.
>>>
>>> Is this expected?
>>
>> That's at least the result I expect, yes.
>>
>> I know this might look weird, indeed. However, I did not find a
>> simple
>> way to avoid this.
> 
>  I think this weird behaviour is acceptable (for now). It is indeed hard to
> avoid, and anyway this is not something that a normal user would ever encounter.
> 
>  In a perfect world the entire download logic would move to a script (which
> admittedly would get a sh*tload of arguments). Then it would be much simpler to
> exit properly.
> 
> 
>  Regards,
>  Arnout
> 
> [snip]
> 


 BTW, if you don't agree with this, you can still push patches 1 to 5 already.
They've got 2 reviews and they will be necessary anyway.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
