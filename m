From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Mar 2014 18:17:40 +0100
Subject: [Buildroot] [PATCH v2] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5332E203.9040904@imgtec.com>
References: <1395769952-64221-1-git-send-email-Vincent.Riera@imgtec.com>
 <5331E0D4.6070007@mind.be> <53321BC8.7020802@gentoo.org>
 <5332E203.9040904@imgtec.com>
Message-ID: <53330BB4.8090102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 Hi Joshua,

On 26/03/14 15:19, Markos Chandras wrote:
> On 03/26/2014 12:14 AM, Joshua Kinard wrote:
>> On 03/25/2014 16:02, Arnout Vandecappelle wrote:
[snip]
>>> Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
>>> o32 ELF files for MIPS64 is an exotic configuration that nobody should be
>>> using. If o32 is required, then is better if it's built for MIPS 32-bit
>>> cores so only 32-bit instructions will be used leading to a more
>>> efficient o32 usage.
>>
>> Just to point out, I wouldn't call this "exotic" -- o32 on mips64 kernels
>> (MIPS-IV ISA) is what I run on my SGI O2 under Gentoo.  That said, I do
>> have
>> a somewhat-working n32 chroot on the same box.  Additionally, isn't o32

 So the mips64 n32 userspace created by buildroot doesn't work
completely, just somewhat?

>> the
>> ABI that Debian still builds for most of their mips/mipsel targets?

 What Debian does is really not relevant here...

> 
> We are talking about using 64-bit instructions in *userland* while
> maintaining the o32 ABI semantics. Well, this is definitely an exotic
> configuration. We are not talking about 64-bit kernels + o32 userland.
> An o32 userland usually comes from mips32 and you usually have only
> 32-bit instructions there.

 Joshua, if you agree with this reasoning, could you ack Vicente's patch?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
