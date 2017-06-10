From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Jun 2017 12:59:13 +0200
Subject: [Buildroot] [PATCH V2 1/1] Arcturus uCLS1012A-SOM support
In-Reply-To: <1a772233-d679-0d8e-337c-12df3b42e669@arcturusnetworks.com>
References: <20170607185010.4652-1-oleks@arcturusnetworks.com>
 <20170608140624.74726acf@free-electrons.com>
 <8ae51e44-2951-9551-3b07-31e1cf942dbd@arcturusnetworks.com>
 <20170608212153.4e67c8af@free-electrons.com>
 <1a772233-d679-0d8e-337c-12df3b42e669@arcturusnetworks.com>
Message-ID: <246742ab-e076-6886-25f6-cedd6cde1b23@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-06-17 21:53, Oleksandr G Zhadan wrote:
> Hello,
> Please see in-line:
> On 06/08/2017 03:21 PM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 8 Jun 2017 12:14:13 -0400, Oleksandr G Zhadan wrote:
>>
>>> Looks like I can correct all things you pointed to, except last one:
>>> My personal preferences as well is to build toolchains from the sources
>>> and we already tried to do it , but, from our experience, in situation
>>> with aarch64 ls1012a support to generate "correct code" we MUST use
>>> EXTERNAL toolchain from Linaro
>> What is the problem that you encounter with the Buildroot generated
>> toolchain? It should definitely work, and if it doesn't, we have a
>> serious problem.
>>
>> At least, we know it builds a toolchain capable of building a kernel +
>> userspace that boots under Qemu.
> We have tried couple different versions of gcc as well as different libraries on
> two different modules, one was NXP FRDM-1012A and one was ours uCLS1012A-SOM.
> Yes, it builds everything OK, but when we run, then on some applications we got
> SIGSEGV.

 That's really pretty bad. If there is some gcc bug, than we should probably get
the patch from Linaro and include it in Buildroot as well. It's weird though
because things seem to run fine on an RPi3 which is also an A53.

 Could you at least report in a little more detail what goes wrong (e.g.
backtrace and disassembly of the SEGV)?

 Regards,
 Arnout

> I didn't remember exactly on which one and is this was on our local build system
> or on buildroot, but we have been testing/investgating for a while (at least 3-4
> monts) and finaly make a decision to stay with Linaro's toolchain on ours and
> buildroot's  build systems, at least for now.
> I couldn't tell you about other Layerscape CPUs, but we do had that issue with
> regular GNU toolchain on modules with  ls1012a CPU.
> 
>>
>>> (and BTW this one is the first/default  choice for aarch64).
>> No: the default for AArch64 is an internal Buildroot toolchain.
> Sorry, I meant that Linaro is the default choice for EXTERNAL toolchain.
>>
>>> And one question:
>>> When I will change the commit title should I send it as a new commit or
>>> as v3 of my previous patches ?
>> A v3 of your previous patches.
> OK.
>>
>> Thanks!
>>
>> Thomas
> Thanks,
> Oleks
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
