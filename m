From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 9 Feb 2007 19:48:34 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <20070209182145.GU12488@aon.at>
References: <FA7EECCA3735EF46BE49245D249B788CE2E308@exchange1.wgate.com>
	<200702091857.13886.yann.morin.1998@anciens.enib.fr>
	<20070209182145.GU12488@aon.at>
Message-ID: <200702091948.35311.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,
All,

On Friday 09 February 2007 192, Bernhard Fischer wrote:
> On Fri, Feb 09, 2007 at 06:57:13PM +0100, Yann E. MORIN wrote:
> >On Friday 09 February 2007 152, Bernhard Fischer wrote:
> >> I'm curious as to why you think we don't have -lfloat?
> >I din't say that either.
> Well, IIRC one of your patches (for gcc-4.0.4 in this thread) removed
> -lfloat which begs the above question :)

Right. Fact is that I also find a library that is years old is either:
  - deprecated,
  - very stable.

As a default, I consider it deprecated, fumble in the other sources I have
(eg. gcc), find possible alternatives, try to make them work, and only if
that fails, will I reconsider libfloat (which I'll do this WE!)

> I simply do not know when gcc grew it's own float-fallbacks (and i don't
> want to search for it, TBH).

Bahhh... :-)
3.4.4: has it
4.0.4: code there, not used, activation patch needed
4.1.1: code there, not used, activation patch needed
Others: unknown.

> >As I said in an earlier post, I don't use buildroot to build my toolchains
> >(because I need toolchains, not a rootfs, and for other technical reasons).
> Fair enough, but let me point out that recently a patch went in that
> allows to use an external toolchain, fwiw ?).

Yep. I've seen (and not quite had time to test). But you still need a way to
actually build that external toolchain, no? :-)))

One of the limiting design with buildroot is that it mixes the destination
rootfs directory with the sys-root of the toolchain, thus requiring to either:
  - save the rootfs directory before fr-building a completely new rootfs (or
    the libc.so and the likes is lost),
  - re-build the full toolchain when oine 'accidentally' remove his/her rootfs.

> Could very well be that an external libfloat isn't needed anymore.

Could very well be that we still do... :-(

> Still, i, personally since i'm in the fortunate position to have an mmu
> as well as an FPU natively, have no idea how i could simulate
> appropriate targets, thus my plea for a kernel .config for an mmu-less,
> softfloat target that i can emulate with e.g. qemu :-/

I have none either. qemu emulates an MMU processor (for x86 and ARM at least).
I've tried yesterday evening to build qemu-bootable kernel and busybox-based
rootfs, but I failed miserably... :-( May be the WE will see it...

> We currently have in buildroot (short of /me having any test-target for
> [+-]mmu and/or float variants):
[--SNIP--]
> Help on that option can be obtained from invoke.texi from gcc or the
> respective online-docs somewhere at http://gcc.gnu.org/

Yep, I've seen that. I'm using --with-float and -mfpu, but not -mfloat-abi.
Will try it also.

> ?) Sounds like marketing mumble, really, but heck :)

Hehe! :-) Every one's trying to promote his tool! :-)

> friendly,
> Bernhard

Yours,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
