From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Feb 2009 13:34:30 +0100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build
	in	$(PROJECT_BUILD_DIR)
In-Reply-To: <87fxiaaain.fsf@macbook.be.48ers.dk>
References: <20090217050218.GA20875@cloud.net.au>
	<87wsbmad7g.fsf@macbook.be.48ers.dk> <20090219113320.GB1829@mx.loc>
	<87fxiaaain.fsf@macbook.be.48ers.dk>
Message-ID: <20090219123430.GD1829@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 19, 2009 at 01:14:56PM +0100, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
> Bernhard> I admit that i didn't look but it sounds a bit like you
> Bernhard> would want to do the same like i did for THIS_SRCDIR
> Bernhard> (THIS_BUILDDIR comes to mind).  HTH,
>
>The target-specific-variable make feature is indeed usefull, but I
>don't quite see how to apply it in this case.

in this case just pickup an eventually given per-package objdir instead
of always using BUILD_DIR, perhaps something like
OBJDIR=$(if $$($(2)_BUILDDIR),$$($(2)_BUILDDIR),$(BUILD_DIR))

so you can just
package/foo/foo.mk:FOO_BUILDDIR=$(PROJECT_BUILDDIR)
(modulo typos)
