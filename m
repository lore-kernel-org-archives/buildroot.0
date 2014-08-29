From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Aug 2014 09:18:15 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-autotools: use
	--disable-dependency-tracking
In-Reply-To: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 28 Aug 2014 23:03:44 +0200")
References: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx4vrcg8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > By default, automake does "dependency tracking", which allows the
 > generated Makefile to contain the necessary dependencies to
 > automatically rebuild the appropriate C files when included header
 > files are changed. This dependency tracking is nice when doing active
 > development on the package, but not really useful when doing a
 > one-time build of the package. According to automake's
 > documentation[1], disabling the dependency tracking provides a small
 > speed-up.

 > In some very unscientific measurements (i.e repeated only once), we
 > have noticed a ~3.6% reduction of the total build time of a Buildroot
 > toolchain after applying this patch.

 > [1] http://www.gnu.org/software/automake/manual/html_node/Dependency-Tracking.html

3% isn't much, but OK - Committed both to next, thanks.

-- 
Bye, Peter Korsgaard
