From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Oct 2015 16:20:29 +0200
Subject: [Buildroot] [PATCH 1/1] configs/xilfpga: Add xilfpga defconfig
In-Reply-To: <5628ABC9.50300@imgtec.com>
References: <1445439476-32911-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20151021171402.5d9aa7d0@free-electrons.com> <5628ABC9.50300@imgtec.com>
Message-ID: <5628F0AD.3090906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 11:26, Zubair Lutfullah Kakakhel wrote:
> Hi,
> 
> On 21/10/15 16:14, Thomas Petazzoni wrote:
>> Zubair,
>>
>> On Wed, 21 Oct 2015 15:57:56 +0100, Zubair Lutfullah Kakakhel wrote:
>>> Under the IMG University Program 'MIPSfpga', RTL verilog code for a MIPS
>>> m14kEC core is released under an academic license.
>>>
>>> The core is used to make a soft-SOC which can run the Linux kernel +
>>> buildroot.
>>
>> Cool! :-)
>>
> 
> Indeed :)
> 
>>>
>>> This patch adds a defconfig for it and a readme file.
>>>
>>> The config generates a simple mips32r2 rootfs using uClibc.
>>>
>>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>>> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>
>>> ---
>>> p.s.
>>>
>>> The kernel patches for MIPSfpga will hopefully be upstreamed by 4.4.
>>>
>>> Once that is done, I'll look into adding the stuff to enable buildroot
>>> to compile the kernel as well.
>>
>> A defconfig which doesn't build a kernel nor a bootloader is pretty
>> useless IMO.
>>
>> Isn't the code to build this kernel available on some Git repository,
>> even if it's not upstream yet ? If so, then it would be better to have
>> a defconfig that points to this Git repository (actually, many of our
>> defconfigs point to non-upstream kernel source code).
> 
> The users of MIPSfpga are academics who receive the patches along with
> other documentation + MIPS core tar-balled up in a package.
> 
> Hence, instead of making a staging repo on github, I went for directly
> up-streaming things.

 Well, to be able to upstream, you must have at least a local repo, so it's just
a matter of pushing that to github or gitlab.

> I do intend to make buildroot build the kernel when the time comes.
> 
> e.g.
> https://patchwork.linux-mips.org/project/linux-mips/list/?submitter=6836

 If those patches are all that is needed, it would be possible to include them
in buildroot. Or download them from patchwork. We're really not going to accept
a defconfig that doesn't build a kernel.

 What about the bootloader?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
