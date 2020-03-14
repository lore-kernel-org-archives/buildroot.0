From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:31:51 +0100
Subject: [Buildroot] [PATCH] package/libsvgtiny: fix parallel build
In-Reply-To: <20200222214439.18588-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 22 Feb 2020 22:44:39 +0100")
References: <20200222214439.18588-1-giulio.benetti@benettiengineering.com>
Message-ID: <87blozxb1k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Fix previous commit[1] which purpose was to fix parallel build. It
 > didn't work since it assigned $(MAKE1) to LIBSVGTINY_MAKE, but this is a
 > generic-package and building is done using $(MAKE), then LIBSVGTINY_MAKE
 > was ignored. Let's substitute instead $(MAKE) with $(MAKE1) in
 > LIBSVGTINY_BUILD_CMDS.

 > [1]:
 > https://git.buildroot.net/buildroot/commit/?id=26d67a2599d6c88facd5178de853fa355244e7c2

 > Fixes:
 > http://autobuild.buildroot.net/results/67d/67d341c0cc272323d6e231a20796a6848c21d760/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
