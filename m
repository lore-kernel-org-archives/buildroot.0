From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Dec 2010 21:45:56 +0100
Subject: [Buildroot] [PATCH] netperf: add Gentoo patch to fix buffer
	overflow compiler warnings
In-Reply-To: <855e95b6e3f2b8aba90318035d9951ac9d1a5cb3.1293384653.git.smiley73@users.sourceforge.net>
	(heiko@zuerker.org's message of "Sun, 26 Dec 2010 11:31:15 -0600")
References: <855e95b6e3f2b8aba90318035d9951ac9d1a5cb3.1293384653.git.smiley73@users.sourceforge.net>
Message-ID: <87vd2flzaz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "heiko" == heiko  <heiko@zuerker.org> writes:

 heiko> From: Heiko Zuerker <smiley73@users.sourceforge.net>
 heiko> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 heiko> ---
 heiko>  package/netperf/netperf-2.4.5-netserver.patch |   51 +++++++++++++++++++++++++

So this just fixes a build warning, and otherwise doesn't affect the
resulting binaries?

 heiko> ++++ b/src/netserver.c
 heiko> +@@ -142,7 +142,7 @@
 heiko> + 
 heiko> + #ifndef DEBUG_LOG_FILE
 heiko> + #ifndef WIN32
 heiko> +-#define DEBUG_LOG_FILE "/tmp/netperf.debug"
 heiko> ++#define DEBUG_LOG_FILE "/var/log/netperf.debug"

What's the reason for this change?

-- 
Bye, Peter Korsgaard
