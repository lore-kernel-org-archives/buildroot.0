From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 23:48:39 +0100
Subject: [Buildroot] [PATCH] pixman: add patch to fix Microblaze build
	failure
In-Reply-To: <1393107813-30143-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 23:23:33 +0100")
References: <1393107813-30143-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3cmrcfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Microblaze build of pixman was failing due to FE_DIVBYZERO not
 > being implemented. It turns out that the usage of it, like fenv.h and
 > feenableexcept() is optional. So the patch simply adds a configure
 > check and disables the appropriate code (which is only use in the
 > tests anyway).

 > This commit also renames the existing patch to follow the patch naming
 > convention, and get a reliable ordering when applying patches.

 > Fixes:

 >   http://autobuild.buildroot.org/results/806/8064092cdbac85fbf4322429d29d5d11dc51860f/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
