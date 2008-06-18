From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 09:36:04 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080618011812.GE4283@cloud.net.au> (Hamish Moffatt's message of
	"Wed\, 18 Jun 2008 11\:18\:12 +1000")
References: <20080616122246.C821B3C987@busybox.net>
	<20080617042319.GA17083@cloud.net.au>
	<87ej6wwmxw.fsf@macbook.be.48ers.dk>
	<20080617104754.GA25850@cloud.net.au>
	<87fxrcmazj.fsf@macbook.be.48ers.dk>
	<20080618011812.GE4283@cloud.net.au>
Message-ID: <87y753b3ff.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> How would everyone react to a patch which redefines BUILD_DIR
 Hamish> to match PROJECT_BUILD_DIR, ie each project would have
 Hamish> project_build_$arch/$project/staging_dir etc?

 Hamish> I think Ulf commented in the past that he doesn't want to
 Hamish> waste the time spent compiling each package for each board
 Hamish> separately, but that seems to be the only way to do it
 Hamish> correctly.

Maybe there's a solution in between. Put packages that really can only
be built one way under build_, and all other packages under
project_build, and then have STAGING_DIR under project_build as well
(with some logic to copy/symlink in the toolchain stuff). Then each
variant could use different versions / configurations of the packages,
and we would still only compile the stuff under build_ once (per
version).

-- 
Bye, Peter Korsgaard
