From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Mar 2009 15:39:04 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090324135302.GY27893@whatever.nu>
References: <20090318132530.GF18723@buzzloop.caiaq.de>
	<20090318142514.GE27893@whatever.nu>
	<20090318144657.GC19956@buzzloop.caiaq.de>
	<20090318155323.GG27893@whatever.nu>
	<20090319083953.GE30293@buzzloop.caiaq.de>
	<20090324123710.GW27893@whatever.nu>
	<20090324131156.GA22599@buzzloop.caiaq.de>
	<20090324131904.GX27893@whatever.nu>
	<20090324132946.GA23829@buzzloop.caiaq.de>
	<20090324135302.GY27893@whatever.nu>
Message-ID: <20090324143904.GD22599@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 24, 2009 at 02:53:02PM +0100, Per-Henrik Lundblom wrote:
> > 
> >   http://lists.arm.linux.org.uk/lurker/message/20090123.185306.b2c4bb05.en.html
> > 
> > Conclusion is: do not build your kernel using a compiler that generates
> > iwmmxt code. As these extensions can't be used from both the kernel and
> > userspace at the same time, it is reserved for user's binaries and hence
> > forbidden in the kernel.

I was a little unprecise here: you can use the same compiler to build
your kernel and iwmmxt enabled user space binaries, the important thing
is that gcc does not generate code with these extensions unless it was
explicitly asked to do so. Screwed up br2 configs in conjunction with
some broken internal dependencies in buildroot (which habe been fixed
already) made gcc to do than unprovoked, which caused the built of
unbootable kernels.

> That makes sense... Shouldn't buildroot automagically just solve this
> for me? ;)
> 
> In build_arm/staging_dir/usr/bin I only have arm-linux-uclibcgnueabi-*
> gcc tools. I guess those is not the right ones to build the kernel then?

You can't judge from the names, but the location is fine. Just make
sure you get a EABI enabled gcc that does not use the fancy iwmmxt
extensions _by_default_. Play around with the br2-settings, your problem
is certainly somewhere there. And could you post the solution here for
others? :)

Daniel
