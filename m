From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Feb 2010 15:23:57 +0100
Subject: [Buildroot] [git commit master] busybox: add upstream 1.16 fix
In-Reply-To: <20100226094313.C4AD47775C@busybox.osuosl.org> (Thomas
	Petazzoni's message of "Fri, 26 Feb 2010 10:42:26 +0100")
References: <20100226094313.C4AD47775C@busybox.osuosl.org>
Message-ID: <87k4u03wjm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> commit: http://git.buildroot.net/buildroot/commit/?id=1d7b6f65c633865b25c8603975f9aec88e4e1275
 Thomas> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 Thomas> Fixes https://bugs.busybox.net/show_bug.cgi?id=1177, available at
 Thomas> http://busybox.net/downloads/fixes-1.16.0/busybox-1.16.0-fsync.patch.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/busybox/busybox-1.16.0-fsync.patch |   13 +++++++++++++
 Thomas>  1 files changed, 13 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/busybox/busybox-1.16.0-fsync.patch

 Thomas> diff --git a/package/busybox/busybox-1.16.0-fsync.patch b/package/busybox/busybox-1.16.0-fsync.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..b0d73ee
 Thomas> --- /dev/null
 Thomas> +++ b/package/busybox/busybox-1.16.0-fsync.patch
 Thomas> @@ -0,0 +1,13 @@
 Thomas> +diff -urpN busybox-1.16.0/coreutils/fsync.c busybox-1.16.0-fsync/coreutils/fsync.c
 Thomas> +--- busybox-1.16.0/coreutils/fsync.c	2010-01-25 01:59:38.000000000 +0100
 Thomas> ++++ busybox-1.16.0-fsync/coreutils/fsync.c	2010-02-26 08:24:59.000000000 +0100
 Thomas> +@@ -7,6 +7,9 @@
 Thomas> +  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
 Thomas> +  */
 Thomas> + #include "libbb.h"
 Thomas> ++#ifndef O_NOATIME
 Thomas> ++# define O_NOATIME 0
 Thomas> ++#endif

Hmm, this conflicts with the -compat patch, which also adds this - So
I'll revert.

-- 
Bye, Peter Korsgaard
