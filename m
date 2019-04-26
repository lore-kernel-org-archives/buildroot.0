From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:48:11 +0200
Subject: [Buildroot] [git commit] package/qt5base: fix qmake parallel
 build
In-Reply-To: <20190422202033.9D1AD814A2@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 22 Apr 2019 22:25:10 +0200")
References: <20190422202033.9D1AD814A2@busybox.osuosl.org>
Message-ID: <87ftq5yltg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a1c175cc9ecc411305dc6f0979f0dd262f2c8d5c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When configuring qt5base, qmake is built, but it's not built in parallel
 > mode. This is due to MAKEFLAGS having 2 dashes on its tail, so this:
 > MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)"
 > expands in this(i.e. 5 njobs):
 > MAKEFLAGS="--no-print-directory -- -j5"
 > and -j5 gets ignored due to "--" preceeding -j5.
 > Double dashes are part of $(MAKEFLAGS) only when evaluated by shell.

 > Swap $(MAKEFLAGS) and -j$(PARALLEL_JOBS) to avoid having "--" before
 > -j$(PARALLEL_JOBS), this way -j$(PARALLEL_JOBS) won't be ignored by
 > ./configure.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
