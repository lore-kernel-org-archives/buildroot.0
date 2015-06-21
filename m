From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Jun 2015 14:58:02 +0200
Subject: [Buildroot] [PATCH] kvmtool: add new package
In-Reply-To: <558691E8.5020001@free-electrons.com>
References: <1434652188-30662-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <5585D3D3.4060708@mind.be> <558691E8.5020001@free-electrons.com>
Message-ID: <5586B4DA.40609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/21/15 12:28, Gustavo Zacarias wrote:
> On 20/06/15 17:57, Arnout Vandecappelle wrote:
> 
>>   Could you add a hash file?
> 
> I didn't know we were adding hashes to git sources, it's bad for a couple of
> reasons.

 Argh, silly me.

[snip]
>>> +    # No MADV_HUGEPAGE define in uClibc(-ng)
>>
>>   That's weird, it comes from kernel headers and I do see it in
>> asm-generic/mman-common.h. But that is not included by sys/mman.h, so you need
>> to include asm/mman.h...
> 
> I don't think that's correct, it may work, but the madvise manpages says that
> only sys/mman.h is required.
> The MADV_ defines in uclibc are in bits/mman.h, like on glibc and musl, so
> basically they're incomplete/old and a patch to uclibc would be the correct way
> to fix this.

 OK.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
