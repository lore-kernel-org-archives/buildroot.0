From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 17:19:36 +0200
Subject: [Buildroot] package/linux/Makefile.in does not include
	'openswan' patches
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
	<20070723132936.GB7902@aon.at> <20070723142207.GA9324@aon.at>
Message-ID: <000401c7cd42$28b0cec0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Mon, Jul 23, 2007 at 03:29:36PM +0200, Bernhard Fischer wrote:
>>On Mon, Jul 23, 2007 at 03:11:26PM +0200, Ulf Samuelsson wrote:
>>>The Kernel Headers buildscript applies the openswan patches 
>>>on top of the kernel headers, but the target/linux/Makefile.in does not.
>>
>>The headers (which used the very same sourcedir, dunno if it still does
>>with your toolchain/linux* stuff) have to be patched. To achieve this,
>>we patch the source before installing the headers.
>>>
>>>Isn't this a bug?
>>
>>I don't understand? You can't apply patches twice, if you mean to
>>suggests this (you most likely don't, i assume).
> 
> ok, you broke building a linux kernel.
> 

No, Stephen did...
He patched the linux makefile with the BSP patch.
Please give the credit where it is due.

> excerpt:
> make[1]: Leaving directory
> `/scratch/obj.i686/buildroot.mine/toolchain_build_i386/module-init-tools-3.2.2'
> touch -c
> /scratch/obj.i686/buildroot.mine/toolchain_build_i386/module-init-tools-3.2.2/depmod
> /usr/bin/install -D
> /scratch/obj.i686/buildroot.mine/toolchain_build_i386/module-init-tools-3.2.2/depmod
> /scratch/obj.i686/buildroot.mine/build_i386/staging_dir/bin/i386-linux-depmod26
> make: *** No rule to make target
> `/scratch/obj.i686/buildroot.mine/project_build_i386//linux-2.6.21.5/.patched',
> needed by
> `/scratch/obj.i686/buildroot.mine/project_build_i386//linux-2.6.21.5/.configured'.
> Stop.
> 
> 
> This is due to this PROJECT thing. Please revert immediately or fix ASAP.
> 
> While i understand that it's possible that one thing or another can
> break in the course of changes, i ask you to be more careful.
> 

Please be more careful in who you are addressing your  comments. 

Furthermore, it would be more constructive to patch the module-init-tools.

I generated the linux-experimental directory, to be able to do more tests and I got flak for that.

> regards,


Best Regards
Ulf Samuelsson
