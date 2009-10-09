From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Oct 2009 11:38:21 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <87zl81hbed.fsf@macbook.be.48ers.dk>
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
	<cover.1254994304.git.rep.dot.nop@gmail.com>
	<2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk>
Message-ID: <20091009093821.GG2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 08, 2009 at 10:35:22PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> On Thu, Oct 08, 2009 at 08:55:48PM +0200, Peter Korsgaard wrote:
> >>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
> >> 
> Bernhard> In a pristine checkout the -menuconfig targets need their build dirs
> Bernhard> to exist.
> >> 
> >> Really? I cannot reproduce it:
> >> 
> >> git clone ~/source/buildroot; cd buildroot
> >> yes ''|make oldconfig >/dev/null
>
> Bernhard> No. You already created the dirs here.
>
>Ok, but you need a config with busybox/uclibc/linux26 enabled, otherwise
>none of those targets make sense.
>
>Anyway, doing:
>
>git clone ~/source/buildroot; cd buildroot
>cp ~/source/buildroot/.config . # has busybox enabled
>make busybox-menuconfig
>Makefile:281: .config.cmd: No such file or directory
>make: *** No rule to make target `.config.cmd'.  Stop.
>
>Adding dirs to the busybox-menuconfig dependency won't change anything
>about that.

my bad, you're right that i did:
$ git clone
$ make defconfig
$ rm -rf output
somebody should fix the clean targets!!
$ make linux26-menuconfig

and that failed.

>doing touch .config.cmd; make busybox-menuconfig works.
