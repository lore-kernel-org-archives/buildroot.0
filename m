From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jun 2016 21:36:54 +0200
Subject: [Buildroot] [PATCH] Binutils: ARC: Fix build failures if
	makeinfo is missing
In-Reply-To: <1465211659-23861-1-git-send-email-vzakhar@synopsys.com>
 (Zakharov Vlad's message of "Mon, 6 Jun 2016 14:14:19 +0300")
References: <1465211659-23861-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87twh6hzxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zakharov" == Zakharov Vlad <Vladislav.Zakharov@synopsys.com> writes:

 > Build failed when "makeinfo" was missing on the build host.
 > This was happening because "makeinfo" is required to build .info targets
 > and make exited with error. The issue hadn't appeared before as there was
 > prebuilt documentation in ARC binutils tarballs, so no attempts had been
 > made to build docs.

 > Missing "makeinfo" only stops us from building docs
 > ("missing" script already throws a warning on that regard).
 > Let's continue to build other targets.

 > Now exit code of the script called "missing" is checked.
 > The value 127 means that "makeinfo" is not available on the build host.

 > So when such value occurs, 0 is returned to the top level makefile.
 > Documentation is not being built but further build of binutils continues.

 > Fixes http://autobuild.buildroot.net/results/55c/55cd09a559016f4f252f0e4c27313b9806135cf4//

 > Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
