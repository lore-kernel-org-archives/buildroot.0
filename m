From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 07:22:27 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
In-Reply-To: <20090121002712.88E7B77099@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Wed\, 21 Jan 2009 00\:27\:12 +0000 \(UTC\)")
References: <20090121002712.88E7B77099@busybox.osuosl.org>
Message-ID: <874oztuqjg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-21 00:27:11 +0000 (Wed, 21 Jan 2009)
 ulf> New Revision: 24933

 ulf> Log:
 ulf> add patch form cgicc'upstream, build now completes\!

 ulf> Added:
 ulf>    trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch


 ulf> Changeset:
 ulf> Added: trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch	                        (rev 0)
 ulf> +++ trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch	2009-01-21 00:27:11 UTC (rev 24933)
 ulf> @@ -0,0 +1,38 @@
 ulf> +From: Robert Schwebel <r.schwebel@pengutronix.de>
 ulf> +Subject: [patch] sort is now in <algorithm>
 ulf> +
 ulf> +When built with gcc-4.3.2, cgicc-3.2.7 cannot be compiled any more; sort
 ulf> +is now being part of <algorithm> and must be written as ::sort:
 ulf> +
 ulf> +cardgame.cpp:1232: error: 'sort' was not declared in this scope
 ulf> +make[2]: *** [cardgame.o] Error 1
 ulf> +
 ulf> +Fix it.
 ulf> +
 ulf> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
 ulf> +
 ulf> +---
 ulf> + demo/cardgame.cpp |    3 ++-
 ulf> + 1 file changed, 2 insertions(+), 1 deletion(-)

Why are we building demos in the first place?


-- 
Bye, Peter Korsgaard
