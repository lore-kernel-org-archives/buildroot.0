From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Dec 2010 13:26:10 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.02/fix-ccache-support
In-Reply-To: <20101207001457.56309418@surf> (Thomas Petazzoni's message of
	"Tue, 7 Dec 2010 00:14:57 +0100")
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk> <20101207001457.56309418@surf>
Message-ID: <87d3pdu5ul.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Why here and not in the default ~/.ccache? Is the ~/.ccache
 >> directory content ccache-version dependent?

 Thomas> I don't know how ccache-version dependent are the contents of
 Thomas> the cache directory. In the previous ccache integration, the
 Thomas> cache was inside Buildroot build directory (which I thought was
 Thomas> stupid since you then couldn't share the cache between
 Thomas> different Buildroot builds), but I kept the idea of having a
 Thomas> Buildroot-specific location for the cache.

 Thomas> I don't have strong opinion/arguments on that, so if you say we
 Thomas> should use the default cache location, I'll just do it.

Ok, me neither - Just keep it where it is. It just wasn't clear to me
from the commit message if there was any deeper reason behind it.

 >> I remember we had some problems back when we added --sysroot= to TARGET_CC.
 >> The qt package in particular is stripping the --sysroot argument because
 >> of this.

 Thomas> I just tried Qt, and it built fine. It does not use ccache for the
 Thomas> parts compiled for the host (since we don't tell Qt about $(HOSTCXX)),
 Thomas> but it definitely uses the cache for parts compiled for the target.

Ok, thanks.

 Thomas> Here are the results for a Busybox + Qt build, with a
 Thomas> CodeSourcery glibc ARM external toolchain.

 Thomas> Cold cache
 Thomas> ==========

 Thomas> real    7m41.319s
 Thomas> user    37m53.620s
 Thomas> sys     1m31.660s

 Thomas> Hot cache
 Thomas> =========

 Thomas> real    3m4.738s
 Thomas> user    5m34.480s
 Thomas> sys     0m36.160s

Nice!

 Thomas> I am not strongly advocating the usage of the "ccache /path/to/gcc"
 Thomas> solution compared to the symbolic link solutions, but if the first
 Thomas> solution works, I find it better because: 1) it's nicer and 2) it's
 Thomas> easier to implement with external toolchains.

Ok, fine by me if it works.

Care to send a new pull request with the few issues I pointed out fixed,
then I'll commit it?

-- 
Bye, Peter Korsgaard
