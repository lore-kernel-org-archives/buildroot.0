From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:17:16 +0200
Subject: [Buildroot] [PATCH] faketime: add patch to disable -Werror
In-Reply-To: <20180517215153.23753-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 17 May 2018 23:51:53 +0200")
References: <20180517215153.23753-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lgbl81lv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > faketime currently doesn't build on host machines that use gcc 8.x due
 > to stricter checks done by gcc, and the fact that it is built with
 > -Werror.

 > As a simple stop-gap measure, this commit patches the faketime
 > Makefile to not use -Werror anymore.

 > The actual fixes for the gcc 8.x issues have been submitted upstream
 > at https://github.com/wolfcw/libfaketime/pull/161, but disabling
 > -Werror is a much smaller fix.

 > Also, it is worth mentioning that removing -Werror makes the existing
 > patch 0001-Disable-the-non-null-compare-warning-error.patch (which was
 > just disabling one specific warning). We nonetheless keep this patch
 > around as it is a backport from upstream.

 > Fixes:

 >   http://autobuild.buildroot.net/results/bd223dfa1c4baa68e427d4941bd2e9917e22da84/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
