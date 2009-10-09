From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Oct 2009 14:39:31 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <878wfkhitf.fsf@macbook.be.48ers.dk>
References: <2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk> <20091009093821.GG2266@mx.loc>
	<87vdiohl1r.fsf@macbook.be.48ers.dk> <20091009112619.GL2266@mx.loc>
	<87iqeohkam.fsf@macbook.be.48ers.dk> <20091009115425.GN2266@mx.loc>
	<878wfkhitf.fsf@macbook.be.48ers.dk>
Message-ID: <20091009123931.GP2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 09, 2009 at 02:07:24PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
> Bernhard> cool, so let's configure the beast:
> Bernhard> $ make linux26-menuconfig
>
>OK, that one I can reproduce. So the fix only really fixes a problem
>with linux26, as uclibc has mkdir -p $(TOOLCHAIN_DIR) in it's .unpacked
>rule and busybox depends on BUILD_DIR.

I retract my proposed patch.

I agree this mess should be delt with differently.
move INSTALL?=
to toplevel makefile
MKDIR_P ?= $(INSTALL) -d
there.
remove approximately all manual invocations of "mkdir -p".
Finally remember that, for each targets some stamps
need one (or some) dir as prereq, so spell them out in
one two-liner rule once and for all.

There will be only a handful of "manual" MKDIR_P occurances left
for the few packages that are exceptions.
>
> Bernhard> Note that this is an obvious breakage.
>
>It your commit message would explain the problem, yes ;)

heh :)
