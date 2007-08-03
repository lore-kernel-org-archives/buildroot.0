From: Benjamin Tietz <benjamin@micronet24.de>
Date: Fri, 3 Aug 2007 21:20:49 +0200
Subject: [Buildroot] gcc breaks when compiling in final-stage
In-Reply-To: <20070802180205.GL11697@aon.at>
References: <20070802091021.GD4820@firebird.dresden.micronet24.de>
	<20070802180205.GL11697@aon.at>
Message-ID: <20070803192049.GB4906@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 02, 2007 at 08:02:05PM +0200, Bernhard Fischer wrote:
> On Thu, Aug 02, 2007 at 11:10:21AM +0200, Benjamin Tietz wrote:
> >Hi all,
> >
> >when building the internal toolchain with, at least, gcc 4.1.2 it breaks
> >in the final stage. Complaining about that there is no rule to build
> >/usr/bin/i686-linux-uclibc-as. As you can see, there is the
> >$(STAGING_DIR) missing. Looking into the Makefile, it turns out that a
> >lot of variables named like ORIGINAL_(TOOL)_FOR_TARGET are defined that
> >way; replacing (TOOL) with AS, LD, NM. 
> >There where already installed into the correct lcation, under
> >$(STAGING_DIR)/usr/bin; just these variables are mistakenly generated.
> >
> >What would be the fastest way to fix this?
> 
> revert that ORIGINAL_(TOOL)_FOR_TARGET stuff.
> 
> Ulf, until this stuff works, please create yourself a branch to work on.

I'm sorry but on rereading my mail, I have to realize that I wasn't
clear enough.
those ORIGINAL_..._FOR_TARGET doesn't appear in the buildroots  Makefile
but in the Makefile of the gcc; exactly in
buildroot/toolchain_build_i686/gcc-4.2.1-final/gcc/Makefile.

I'm sorry for that mistake.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
