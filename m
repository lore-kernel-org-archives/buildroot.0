From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 18:56:14 +0200
Subject: [Buildroot] package/linux/Makefile.in does not include
	'openswan' patches
In-Reply-To: <000501c7cd42$2a1b0d20$dcc4af0a@atmel.com>
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
	<20070723132936.GB7902@aon.at> <20070723142207.GA9324@aon.at>
	<20070723144314.GC9324@aon.at>
	<000501c7cd42$2a1b0d20$dcc4af0a@atmel.com>
Message-ID: <20070723165614.GB9995@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 05:25:33PM +0200, Ulf Samuelsson wrote:
>----- Original Message ----- 
>From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
>To: "Ulf Samuelsson" <ulf@atmel.com>
>Cc: "buildroot" <buildroot@uclibc.org>
>Sent: Monday, July 23, 2007 4:43 PM
>Subject: Re: [Buildroot] package/linux/Makefile.in does not include 'openswan' patches
>
>
>> On Mon, Jul 23, 2007 at 04:22:07PM +0200, Bernhard Fischer wrote:
>>>On Mon, Jul 23, 2007 at 03:29:36PM +0200, Bernhard Fischer wrote:
>> 
>>>make: *** No rule to make target
>>>`/scratch/obj.i686/buildroot.mine/project_build_i386//linux-2.6.21.5/.patched',
>>>needed by
>>>`/scratch/obj.i686/buildroot.mine/project_build_i386//linux-2.6.21.5/.configured'.
>>>Stop.
>>>
>>>
>>>This is due to this PROJECT thing. Please revert immediately or fix ASAP.
>> 
>> By now i have reverted these incorrect hunks in svn.
>>>
>
>You did not fix this, since you assume that the kernel headers and the kernel is the same.

I did not mean to imply that it is a fix. I only use the kernel headers
from the kernel i'm using since i see absolutely no benefit (or any
reason) to use something else, personally.

>If they are not, the bug is still there, so it is NOT because of the BSP stuff,
>and you fixed the symptom, not the cause.

I'm not mixing headers and source from different versions but use just
one version for both. This serves my purposes very well.
I don't use nor actively support mixed headers, fwiw. If somebody
expresses a need for such a setup and provides a clean, tested patch
that does not break the common case to use both headers and kernel from
the same source, then fine with me.

>Try setting LINUX26_VERSION to 2.6.22.1 and build with openswan,
>and you see what I mean.
>
>>>While i understand that it's possible that one thing or another can
>>>break in the course of changes, i ask you to be more careful.
>> 
>> I suggest you
>> ifneq ($(PROJECT_BUILD_DIR),)
>> fixup_after_ulf=O=$(PROJECT_BUILD_DIR)
>> endif
>> LINUX26_MAKE_FLAGS+=$(fixup_after_ulf)
>> 
>> but you were about to do the same anyway, weren't you..
>>
>
>No, I want to have two ways of building linux, 
>until the BSP stuff is fully tested, and then merge into one.
>Not fill the single linux makefile with a lot of kludges
>which has no long term validity.

The target/linux/Makefile.in is currently 115 lines (without comments
and whitespace). It provides quite generic rules to unpack, configure
and build a kernel.
What kludges are you referring to specifically?

Using a single source-tree and installing (e.g. via O=) into the
obj-tree is a nice thing, not mandatory though.
