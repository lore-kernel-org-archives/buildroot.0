From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 13:43:06 +0100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build in
	$(PROJECT_BUILD_DIR)
In-Reply-To: <20090219123430.GD1829@mx.loc> (Bernhard Reutner-Fischer's
	message of "Thu\, 19 Feb 2009 13\:34\:30 +0100")
References: <20090217050218.GA20875@cloud.net.au>
	<87wsbmad7g.fsf@macbook.be.48ers.dk> <20090219113320.GB1829@mx.loc>
	<87fxiaaain.fsf@macbook.be.48ers.dk> <20090219123430.GD1829@mx.loc>
Message-ID: <87bpsya97p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> The target-specific-variable make feature is indeed usefull, but I
 >> don't quite see how to apply it in this case.

 Bernhard> in this case just pickup an eventually given per-package
 Bernhard> objdir instead of always using BUILD_DIR, perhaps something
 Bernhard> like OBJDIR=$(if
 Bernhard> $$($(2)_BUILDDIR),$$($(2)_BUILDDIR),$(BUILD_DIR))

 Bernhard> so you can just
 Bernhard> package/foo/foo.mk:FOO_BUILDDIR=$(PROJECT_BUILDDIR)
 Bernhard> (modulo typos)

That's pretty much what I suggested, but it doesn't remove the etra
complexity to the Makefile.autotools.in rules (there's a generic set
of rules going $(BUILD_DIR)/%/.stamp_<something>:). The package
settings for the other things are done with ?= <default>, so adding a
$(2)_BUILDDIR ?= $(BUILD_DIR) would be enough.


-- 
Bye, Peter Korsgaard
