From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jul 2015 09:52:34 +0200
Subject: [Buildroot] [PATCH 1/1] ntp: drop uselss patch fixup which
	sometimes breaks rebuild
In-Reply-To: <1436129545-3540-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sun, 5 Jul 2015 16:52:25 -0400")
References: <1436129545-3540-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87k2udsoxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Drop sed line which no longer changes anything.  Worse, it bumps each
 > ntpd/*.c file's modification time, which sometimes triggers a strange
 > dependency path causing the makefile to attempt to run the ntpd keyword-gen
 > app, which fails, because it's been cross-compiled.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Makes sense, and the affected code has indeed been changed upstream so
it doesn't do anything sensible any more. From CommitLog:

  ntpd/cmd_args.c at 1.56.1.3 +2 -3
    remove unused leftover global specific_interface.
    rindex() -> strrchr()

Committed, thanks.

-- 
Bye, Peter Korsgaard
