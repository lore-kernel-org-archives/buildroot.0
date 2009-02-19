From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 20 Feb 2009 10:39:52 +1100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build
	in	$(PROJECT_BUILD_DIR)
In-Reply-To: <87bpsya97p.fsf@macbook.be.48ers.dk>
References: <20090217050218.GA20875@cloud.net.au>
	<87wsbmad7g.fsf@macbook.be.48ers.dk> <20090219113320.GB1829@mx.loc>
	<87fxiaaain.fsf@macbook.be.48ers.dk> <20090219123430.GD1829@mx.loc>
	<87bpsya97p.fsf@macbook.be.48ers.dk>
Message-ID: <20090219233952.GA17913@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 19, 2009 at 01:43:06PM +0100, Peter Korsgaard wrote:
> >>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
> 
> Hi,
> 
>  >> The target-specific-variable make feature is indeed usefull, but I
>  >> don't quite see how to apply it in this case.
> 
>  Bernhard> in this case just pickup an eventually given per-package
>  Bernhard> objdir instead of always using BUILD_DIR, perhaps something
>  Bernhard> like OBJDIR=$(if
>  Bernhard> $$($(2)_BUILDDIR),$$($(2)_BUILDDIR),$(BUILD_DIR))
> 
>  Bernhard> so you can just
>  Bernhard> package/foo/foo.mk:FOO_BUILDDIR=$(PROJECT_BUILDDIR)
>  Bernhard> (modulo typos)
> 
> That's pretty much what I suggested, but it doesn't remove the etra
> complexity to the Makefile.autotools.in rules (there's a generic set
> of rules going $(BUILD_DIR)/%/.stamp_<something>:). The package
> settings for the other things are done with ?= <default>, so adding a
> $(2)_BUILDDIR ?= $(BUILD_DIR) would be enough.

An alternative would be to move the rules within the macro expansion,
specifying exact filenames (via variable expansion) rather than using 
$(BUILD_DIR)/%/... That would be neater but would add a significant 
number of new rules (after expansion).


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
