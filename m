From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 16:55:34 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080617142937.GD27792@mx.loc> (Bernhard Fischer's message of
	"Tue\, 17 Jun 2008 16\:29\:37 +0200")
References: <20080616122246.C821B3C987@busybox.net>
	<20080617042319.GA17083@cloud.net.au>
	<87ej6wwmxw.fsf@macbook.be.48ers.dk>
	<20080617104754.GA25850@cloud.net.au>
	<87fxrcmazj.fsf@macbook.be.48ers.dk> <20080617142937.GD27792@mx.loc>
Message-ID: <87d4mgkt5l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> So they all put libraries / headers in the same staging_dir? Doesn't
 >> that give problems with packages detecting optional stuff at compile
 >> time that might not be available for a specific variant (E.G. one
 >> variant has expat, and another doesn't - Some configure script checks
 >> for expat and finds it in staging_dir even though it isn't going to be
 >> there at runtime).
 >> 
 >> The same with the packages offering different versions.
 >> 
 >> I think a more common setup would be to install the toolchain
 >> somewhere common (/opt/<whatever>) and then have multiple boards using
 >> the same toolchain/c library but potentially different set of
 >> packages(-versions) and their own staging_dir.

 Bernhard> If i understand correctly what you are talking about then this is
 Bernhard> exactly the purpose of that PROJECT thing, fwiw.

Me? No, the project stuff is (afaik atleast) just about compiling the
configurable packages under project_build_* instead of build_*, so you
can reuse a single working directory / staging_dir for multiple
projects. It has the same drawbacks as what I listed above.

It does sound pretty much what Hamish is doing though.

-- 
Bye, Peter Korsgaard
