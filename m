From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 26 Mar 2008 21:36:02 +0100
Subject: [Buildroot] using of local dir
References: <47EA8F05.8090102@gmx.net> <20080326180926.GA404@mx.loc>
	<877ifp1bzg.fsf@macbook.be.48ers.dk>
Message-ID: <032301c88f86$de33de70$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
> 
> Bernhard> This would have been the correct thing, yes. svn blame Makefile;
> Bernhard> Ah, alright, no surprise..
> 
> Bernhard> Apart from what you mention, i strikes me as broken not to allow for
> Bernhard> BUILDROOT_LOCAL to point to anywhere but to limit it to the TOPDIR
> 


If the shell variable BUILDROOT_LOCAL is defined, then LOCAL can be anywhere,
including relative to the current tree.

> It indeed seems quite broken. The $LOCAL variable isn't used anywhere either.
> 

Check "project.mk"

> Bernhard> *shrug* I'd rip it out in a whim either way
> 
> Well, the local/save/getconfig stuff does seem kinda overengineered -
> Couldn't we just have a bunch of *_defconfig files under configs/
> instead with a make %_defconfig target like the kernel has instead?
> 

The purpose of this is to allow you to start with an existing defconfig,
and the commands will collects the different configurations in one place.
You can't replace this function with defconfigs, but you can use the result
to create new defconfigs.


At this time, not having access to the source tree, I can't see why LOCAL
is defined *after* the include, so maybe this needs to be moved.
Feel free to test.



> -- 
> Bye, Peter Korsgaard





Best Regards
Ulf Samuelsson
