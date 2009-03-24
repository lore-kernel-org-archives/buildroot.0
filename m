From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Mar 2009 14:29:46 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090324131904.GX27893@whatever.nu>
References: <20090318123004.GE18723@buzzloop.caiaq.de>
	<20090318131349.GD27893@whatever.nu>
	<20090318132530.GF18723@buzzloop.caiaq.de>
	<20090318142514.GE27893@whatever.nu>
	<20090318144657.GC19956@buzzloop.caiaq.de>
	<20090318155323.GG27893@whatever.nu>
	<20090319083953.GE30293@buzzloop.caiaq.de>
	<20090324123710.GW27893@whatever.nu>
	<20090324131156.GA22599@buzzloop.caiaq.de>
	<20090324131904.GX27893@whatever.nu>
Message-ID: <20090324132946.GA23829@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 24, 2009 at 02:19:04PM +0100, Per-Henrik Lundblom wrote:
> > So you don't see the kernel booting at all? That sounds like a problem
> > unrelated to OABI/EABI issues. I suggest you ask at the ARM Linux kernel
> > mailing list.
> 
> Yup, I guess so too. It is probably a misconfiguration from my side, but
> the strange thing is that I just modified some small things (like
> enabling EABI binary support). It may be related to the newly built
> toolchain, I don't know.

Please have a look at this thread:

  http://lists.arm.linux.org.uk/lurker/message/20090123.185306.b2c4bb05.en.html

Conclusion is: do not build your kernel using a compiler that generates
iwmmxt code. As these extensions can't be used from both the kernel and
userspace at the same time, it is reserved for user's binaries and hence
forbidden in the kernel.

Daniel
