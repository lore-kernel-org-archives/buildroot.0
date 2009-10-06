From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Oct 2009 20:47:55 +0200
Subject: [Buildroot] [PATCH 2/6] always append FPU_SUFFIX
In-Reply-To: <20091006184042.GA10261@mx.loc> (Bernhard Reutner-Fischer's
	message of "Tue\, 6 Oct 2009 20\:40\:42 +0200")
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<87iqes2wye.fsf@macbook.be.48ers.dk> <20091006184042.GA10261@mx.loc>
Message-ID: <87ws381hr8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> On Tue, Oct 06, 2009 at 08:34:17PM +0200, Peter Korsgaard wrote:
 >>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
 >> 
 >> Why?

 Bernhard> I can have (e.g.) m68k toolchains with and without fpu/mmu.
 Bernhard> It's much easier to just use _nofpu_nommu suffices than to repeatedly
 Bernhard> rebuild for a gazillion of different combinations.

Huh? You still have to rebuild just like before, the only minor
advantage is that the rootfs image doesn't get overwritten if you don't
delete the images dir before rebuilding.

I don't particular mind the nofpu/mmu suffixes, but where to end?
There's also abi, cpu variant, debug/optimzation level and hundreds of
other options.

I think we should just suggest people to use the O= support we already
have to put the output dirs somewhere else if they want to do something
like this.

-- 
Bye, Peter Korsgaard
