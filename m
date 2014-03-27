From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Thu, 27 Mar 2014 09:27:50 +0000
Subject: [Buildroot] [PATCH v2] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5333667C.4060404@gentoo.org>
References: <1395769952-64221-1-git-send-email-Vincent.Riera@imgtec.com>
 <5331E0D4.6070007@mind.be> <53321BC8.7020802@gentoo.org>
 <5332E203.9040904@imgtec.com> <53330BB4.8090102@mind.be>
 <5333667C.4060404@gentoo.org>
Message-ID: <5333EF16.1090808@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/26/2014 11:45 PM, Joshua Kinard wrote:
> On 03/26/2014 13:17, Arnout Vandecappelle wrote:
>>
>>   Hi Joshua,
>>
>> On 26/03/14 15:19, Markos Chandras wrote:
>>> On 03/26/2014 12:14 AM, Joshua Kinard wrote:
>>>> On 03/25/2014 16:02, Arnout Vandecappelle wrote:
>> [snip]
>>>>> Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
>>>>> o32 ELF files for MIPS64 is an exotic configuration that nobody should be
>>>>> using. If o32 is required, then is better if it's built for MIPS 32-bit
>>>>> cores so only 32-bit instructions will be used leading to a more
>>>>> efficient o32 usage.
>>>>
>>>> Just to point out, I wouldn't call this "exotic" -- o32 on mips64 kernels
>>>> (MIPS-IV ISA) is what I run on my SGI O2 under Gentoo.  That said, I do
>>>> have
>>>> a somewhat-working n32 chroot on the same box.  Additionally, isn't o32
>>
>>   So the mips64 n32 userspace created by buildroot doesn't work
>> completely, just somewhat?
>
> No, "somewhat" means I haven't powered that machine up in a while and
> updated it.  It boots into an o32 install I've had since 2005 (and am loathe
> to replace just yet, at least as long as the disks stay alive), and I chroot
> into a separate n32 root.  It's got an old 350MHz RM7000 CPU (PMC-Sierra),
> so updating can take a long time for just the o32 root (gcc is ~17hrs these
> days.  Used to be ~2.5hrs in the gcc-3.4.x days).  Once that's updated, I
> then update the n32 root.  Almost had that done until a recent snow storm
> knocked my power out, and I never resumed the update.
>
>
>>> We are talking about using 64-bit instructions in *userland* while
>>> maintaining the o32 ABI semantics. Well, this is definitely an exotic
>>> configuration. We are not talking about 64-bit kernels + o32 userland.
>>> An o32 userland usually comes from mips32 and you usually have only
>>> 32-bit instructions there.
>>
>>   Joshua, if you agree with this reasoning, could you ack Vicente's patch?
>
> Let me get clarification on what "MIPS64" Vincent was referring to first.
> It's easy to mix that up.  I was assuming he meant o32 userland + mips64
> kernel, which I know still works, even though it is very inefficient (using
> just half of your available CPU registers).  If he's referring to the ISA of
> MIPS64 (or as I read it, mips64r1/mips64r2), then yeah, it's not a problem
> at all.  Though I am not an authority on MIPS' capabilities outside of the
> SGI hardware lineup, as that's all that I have available to play with.
>
>

Yes, maybe the commit message was confusing. We definitely did not mean 
mips64 kernel + o32 userland. We meant 64-bit userland + o32 ABI.

So I guess we are all good here :)

-- 
markos
