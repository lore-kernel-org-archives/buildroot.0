From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 15:09:43 +0200
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <CANK3ZEdaEdw6YuyN-offP1M4F88zdgy_Eg7qikQ5uzUDC2-XKQ@mail.gmail.com>
References: <CANK3ZEdaEdw6YuyN-offP1M4F88zdgy_Eg7qikQ5uzUDC2-XKQ@mail.gmail.com>
Message-ID: <99c56dcf-2a6f-b025-7a70-70d33c64aa96@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-08-17 14:30, Aseem Sharma wrote:
> Hi,
> 
> I am naive to buildroot & processor world trying to compile
> "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor (compatible to
> ARMv5TE instruction-set)" based old system. However, I do not understand the
> options to be selected in "make menuconfig" for 
> 1. Target options->Target Architecture {think should be ARM - little endian}
> 2. Target options->Target Architecture variant

 It is indeed sometimes difficult to find out what the underlying CPU
architecture is for a given SoC. Also, we only have 40-ish variants while gcc
supports something like 100 variants. Anyway, for your CPU, it is certainly ARM
little endian, and most likely xscale variant, though arm926t should work as well.

 You probably need to keep VFP support turned off, but I can't find a reference
that confirms that this CPU is lacking a floating point unit.

 You'll also need some figuring out to find a kernel configuration that works...
Can't help you there, I'm afraid.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
