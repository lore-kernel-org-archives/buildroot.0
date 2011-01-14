From: Kyle Hayes <kyle@greenmonitor.com>
Date: Fri, 14 Jan 2011 14:04:24 -0800
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <201101141504.57536.minimod@morethan.org>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTimU=1_RZohLaLaNZDsfYek3Xr8TbWPZUaCDk6ne@mail.gmail.com>
	<201101141504.57536.minimod@morethan.org>
Message-ID: <AANLkTim5_g-w-7BjhMB4fLRTnZHokr3s5stGP1q03Nni@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

The differences between the 486 and Pentium at the user level were not
that large.   For the OS level, there were a lot more.  This is from
memory of the time when the Pentium came out.  I remember it being a
big deal to have a dual processor P90 on my desk :-)  the PPro was a
completely different animal.  See more below.

On Fri, Jan 14, 2011 at 1:04 PM, Michael S. Zick <minimod@morethan.org> wrote:
>
> It seems you are working in the area of processors that do/do not
> support sse instructions.

Definitely not.  But, neither did the PPro which is what showed up in
the kernel configuration file.   SSE was not until the Pentium-III.
Even if the rest of the code was misconfigured for PPro, it would not
be using SSE.  It might use MMX though, so this is something to check.
 OpenSSH should be using openssl libraries I would think...

> You might check for a "-no-asm" build option on your crypto (sshd) library.
> That might fix your ssh-keygen seg faults.

Ah, good idea.  I'll see if that exists if the problem persists.

> Note: if your using the vortex86dx SoC - the documents I found on-line
> for that says it supports the full instruction set of the 80486SX (I.E:
> none of the instructions that would be based in the fp co-processor).

The Vortex86SX were that way.  The DX is actually pretty close to a
Pentium.  The MX is too (just more things on the SoC).  Support for
AMD K6-2 should be nearly identical to this.  The online documentation
is... not great :-(

> PS: How old a kernel version? ?Linux dropped support for i386 a long time ago.

I am currently using 2.6.37 which came out just a few weeks ago.  It
works fine.  The kernel will exercise more of the differences between
the processors than user code.  I would not be surprised at all to
find that the user code for the latest i7 Core processor is basically
identical (SSE excepted) as the code for the 486 except for
compile-time instruction scheduling.  There are a few new instructions
outside of the SSE set, but not very many.

Once I get a working kernel and can get a core dump, I'll see what I
find.  Maybe strace will help?

Best,
Kyle
