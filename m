From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 9 Aug 2010 14:37:47 +0000 (UTC)
Subject: [Buildroot] Building external i586 ARM cross toolchain on x64
	Linux
References: <AANLkTik6X-qDUV4Uxf6x7FfBwZG6SinA7gzFC+18Aefa@mail.gmail.com>
	<i3hrp5$nia$1@dough.gmane.org>
	<AANLkTi=cJmoQ=45zMBcS2pQeyEENWgtXtic8=Z-U8TLT@mail.gmail.com>
Message-ID: <i3p3rq$ve8$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-09, James Ronald <james.ronald@gmail.com> wrote:
> On Fri, Aug 6, 2010 at 4:36 PM, Grant Edwards <grant.b.edwards@gmail.com>wrote:
>
>> On 2010-08-06, James Ronald <james.ronald@gmail.com> wrote:
>>
>>> Building such on 32 bit Linux distribution works great but I would
>>> like to switch to using a 64 bit Linux distribution and still be able
>>> to build an 32bit (i586) external (portable) tool chain.
>>
>> I don't know why the procedure would be any different.  What exactly
>> failed?
>
> Buildroot will automatically build a 64 bit cross toolchain when run
> on 64 bit Linux and a 32 bit cross toolchain when run on 32 bit
> Linux.  I am asking if there is a buildroot "preferred method" or
> "best practice" for building a 32 bit cross toolchain on on 64 bit
> Linux.

I think I'm confused.  When you say a "64 bit cross toolchain" I read
that as a toolchain for a 64-bit target, and I didn't think the "bit
size" of the host made any difference to Buildroot.

If what you want to do is use Buildroot on architecture A to build a
compiler to run on architecture B for for a target with architecture
C, then that's called a "Canadian Cross", and I don't think buildroot
will do that (unless there's some special case in gcc/binutils for the
IA32 and AMD64 architectures).

You can do it with Crosstool-NG:

  http://ymorin.is-a-geek.org/projects/crosstool#canadian_build

-- 
Grant Edwards               grant.b.edwards        Yow! ... the MYSTERIANS are
                                  at               in here with my CORDUROY
                              gmail.com            SOAP DISH!!
