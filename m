From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Nov 2012 11:07:53 +0100
Subject: [Buildroot] [PATCH] busybox: fix link with tirpc
In-Reply-To: <1353485736-10836-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 21 Nov 2012 09:15:36 +0100")
References: <1353485736-10836-1-git-send-email-arnout@mind.be>
Message-ID: <87sj83i806.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Busybox does partial linking of its modules before linking everything
 Arnout> together into the binary.  Those partial links are done without the
 Arnout> standard libraries, but that also means -ltirpc can't be found.  In
 Arnout> addition, this probably fails horribly with static linking (untested).

 Arnout> The problem is that the LDFLAGS are also used in the partial links.
 Arnout> So instead, use CFLAGS_busybox, which is only used for the busybox
 Arnout> link step.  Also make sure that this is passed through the environment,
 Arnout> not on the command line, so the busybox Makefile can still append to
 Arnout> it.

 Arnout> Fixes e.g.
 Arnout> http://autobuild.buildroot.net/results/e8351e3ba86fdcdb2999548658271a6fde0526a9

Committed, thanks.

-- 
Bye, Peter Korsgaard
