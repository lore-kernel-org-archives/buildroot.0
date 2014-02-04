From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 4 Feb 2014 11:49:05 -0500
Subject: [Buildroot] [PATCH] Makefile: change rsync used in overlays to
 always transfer files
In-Reply-To: <CACXmVibcZ=4o_Lv=mP5L5QXgWLqDc1X=4n8SLYP62DfuJJpp4A@mail.gmail.com>
References: <1370655822-2668-1-git-send-email-danomimanchego123@gmail.com>
 <CACXmVibcZ=4o_Lv=mP5L5QXgWLqDc1X=4n8SLYP62DfuJJpp4A@mail.gmail.com>
Message-ID: <CANxTyt6-oLow34LPXLGWki6P3iK5gk0VtqOGtT9LSjYTTNeKJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, Feb 4, 2014 at 11:31 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> Committed with -I changed to --ignore-times as it is a bit more
> obvious what the option does.

Using "--ignore-times" is fine with me - but the problem still exists.
You added the option to the skeleton install's rsync, but not to the
overlay install's rsync, around line 551 of Makefile.  (So, you can
still demonstrate the issue using the AAA/BBB overlays example that I
mentioned in my original submittal.)  Can you add the --ignore-times
to the second rsync?

Danomi -
