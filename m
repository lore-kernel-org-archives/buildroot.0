From: Joshua Kinard <kumba@gentoo.org>
Date: Wed, 26 Mar 2014 19:34:33 -0400
Subject: [Buildroot] [PATCH v2] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5332E203.9040904@imgtec.com>
References: <1395769952-64221-1-git-send-email-Vincent.Riera@imgtec.com>
 <5331E0D4.6070007@mind.be> <53321BC8.7020802@gentoo.org>
 <5332E203.9040904@imgtec.com>
Message-ID: <53336409.8090402@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/26/2014 10:19, Markos Chandras wrote:
> On 03/26/2014 12:14 AM, Joshua Kinard wrote:
>> On 03/25/2014 16:02, Arnout Vandecappelle wrote:
>>> On 25/03/14 18:52, Vicente Olivert Riera wrote:
[snip]
>>> Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
>>> o32 ELF files for MIPS64 is an exotic configuration that nobody should be
>>> using. If o32 is required, then is better if it's built for MIPS 32-bit
>>> cores so only 32-bit instructions will be used leading to a more
>>> efficient o32 usage.
>>
>> Just to point out, I wouldn't call this "exotic" -- o32 on mips64 kernels
>> (MIPS-IV ISA) is what I run on my SGI O2 under Gentoo.  That said, I do have
>> a somewhat-working n32 chroot on the same box.  Additionally, isn't o32 the
>> ABI that Debian still builds for most of their mips/mipsel targets?
> 
> We are talking about using 64-bit instructions in *userland* while
> maintaining the o32 ABI semantics. Well, this is definitely an exotic
> configuration. We are not talking about 64-bit kernels + o32 userland.
> An o32 userland usually comes from mips32 and you usually have only 32-bit
> instructions there.

I think the mixup I am having is the "MIPS64" that Vincent is referring to
is the ISA, e.g., mips64r[12], not "MIPS64" as in "64bit MIPS", right?

-- 
Joshua Kinard
Gentoo/MIPS
kumba at gentoo.org
4096R/D25D95E3 2011-03-28

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
