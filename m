From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Sep 2014 00:44:50 +0200
Subject: [Buildroot] [PATCH] hostname: fix conflicting installs of
	/bin/hostname
In-Reply-To: <1408568566-30391-1-git-send-email-andrew.ruder@elecsyscorp.com>
 (Andrew Ruder's message of "Wed, 20 Aug 2014 16:02:46 -0500")
References: <1408568566-30391-1-git-send-email-andrew.ruder@elecsyscorp.com>
Message-ID: <87lhpl3jq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > Surprisingly long-standing issue with conflicting /bin/hostname
 > installs.  Reported as early as November 2005 by Joseph Dupre.

 > All together at one point or another there are at least 4 possible
 > sources of /bin/hostname:

 >         busybox
 >         util-linux
 >         coreutils
 >         net-tools

 > Buildroot depends on the -F flag being available in the default
 > /etc/inittab.  Out of the 4 listed projects only net-tools and buildroot
 > for sure support the -F flag.  I'm a little unclear on util-linux as it
 > has been removed entirely (in favor of net-tools) for some time.

 > As of coreutils 6.9.90 (2007-12-01), coreutils does not install its
 > /bin/hostname by default.  The following commit reenabled its build:

 > d6e58cb coreutils: fixed missing hostname (Sep 2010)

 > This was done to fix a build error in coreutils regarding help2man.  A
 > later patch:

 > 30c5105 coreutils: bump to version 8.21

 > disabled the help2man functionality entirely but left hostname being
 > installed.

 > On a very related note, net-tools now contains an obsolete check to add
 > util-linux as a dependency to force it to build first (so that net-tools
 > ends up with /bin/hostname).

 > This patch fixes both of these issues so that hostname always comes from
 > one of two places:

 >     busybox
 >     net-tools

 > Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Co-authored-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
