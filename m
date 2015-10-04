From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 11:44:35 +0200
Subject: [Buildroot] [PATCH] ibrdtn-tools: fix linking problem when
	building statically
In-Reply-To: <1441879380-51566-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 10 Sep 2015 11:03:00 +0100")
References: <1441879380-51566-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87bncfvugs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The problem looks like this:
 > /br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr//lib/librt.a(timer_routines.os):
 > In function `__start_helper_thread':
 > timer_routines.c:(.text+0x2f4): undefined reference to `pthread_atfork'
 > collect2: error: ld returned 1 exit status

 > Adding -pthread to LDFLAGS fixes the problem.

 > Fixes:

 >   http://autobuild.buildroot.net/results/a87/a87a764d3a28f835ed8645923594f7023a662ae8/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
