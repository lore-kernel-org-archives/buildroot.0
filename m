From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:07:24 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <20091009115425.GN2266@mx.loc> (Bernhard Reutner-Fischer's
	message of "Fri\, 9 Oct 2009 13\:54\:25 +0200")
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
	<cover.1254994304.git.rep.dot.nop@gmail.com>
	<2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk> <20091009093821.GG2266@mx.loc>
	<87vdiohl1r.fsf@macbook.be.48ers.dk> <20091009112619.GL2266@mx.loc>
	<87iqeohkam.fsf@macbook.be.48ers.dk> <20091009115425.GN2266@mx.loc>
Message-ID: <878wfkhitf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> cool, so let's configure the beast:
 Bernhard> $ make linux26-menuconfig

OK, that one I can reproduce. So the fix only really fixes a problem
with linux26, as uclibc has mkdir -p $(TOOLCHAIN_DIR) in it's .unpacked
rule and busybox depends on BUILD_DIR.

 Bernhard> Note that this is an obvious breakage.

It your commit message would explain the problem, yes ;)

 Bernhard> Look at the makefiles, who do you think should have created
 Bernhard> the build-dir before that?  And yes, just BUILD_DIR, like
 Bernhard> busybox does would be sufficient, but later on you will
 Bernhard> experience that if you just specify BUILD_DIR as prereq then
 Bernhard> you will die in funny ways for toplevel-parallel makes.  (I
 Bernhard> can almost hear you saying that this isn't supported right
 Bernhard> now, so: yes, it isn't but let's just fix it properly to
 Bernhard> avoid this future problem, ok?)

toplevel parallel builds is a lot bigger cake than I care to eat right
now, but I don't have a problem with adding dirs (and removing the mkdir
-p) as a prerequisite to uclibc/busybox/linux26-menuconfig as a cleanup.

Thanks for your presistence.

-- 
Bye, Peter Korsgaard
