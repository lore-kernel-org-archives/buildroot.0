From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 16:38:30 +0100
Subject: [Buildroot] [PATCH] sngrep: use pkg-config to discover OpenSSL
	to fix static linking
In-Reply-To: <1488636958-5291-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 4 Mar 2017 15:15:58 +0100")
References: <1488636958-5291-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87efy9cd1l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Building sngrep with OpenSSL support in static linking configurations
 > currently fails due to undefined symbols in the OpenSSL library. It's
 > the usual problem with using AC_CHECK_LIB() to discover libraries
 > instead of the pkg-config based PKG_CHECK_MODULES().

 > Therefore, this commit introduces a patch that switches to using
 > pkg-config to discover OpenSSL. A preliminary patch is needed, without
 > which appending to LIBS/CFLAGS doesn't work. Both patches have been
 > submitted upstream.

 > Fixes:

 >   http://autobuild.buildroot.net/results/911143de823b2c749ac0a59dfa06adb6ddd3de50/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
