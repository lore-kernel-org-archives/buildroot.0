From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 14:24:29 +0200
Subject: [Buildroot] [PATCH 1/1] psplash: install systemd services
In-Reply-To: <1402520102-24548-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Wed, 11 Jun 2014 22:55:02 +0200")
References: <1402520102-24548-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87wqcldmki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This patch provides service files for using psplash on embedded devices
 > running systemd:

 > - psplash-start.service: start psplash.
 > - psplash-quit.service: kill psplash when reaching multi-user.target

 > The following kernel command line options should also be set:

 >   systemd.show_status=0 quiet splash

 > The option "systemd.show_status=0" is required, because, unlike Plymouth,
 > psplash does not have real systemd integration, i.e. it will not perform:

 >   kill(1, SIGRTMIN + 21);

 > Note that no progress messages will be printed on the splash screen.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
