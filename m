From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 09:42:34 +0100
Subject: [Buildroot] busybox and exporting variables
In-Reply-To: <CALo-6+gWgZ0Oj23CU7MzMtWGYShcL3uPcNUn5Mstj3GO=UCVMA@mail.gmail.com>
 (Charles Krinke's message of "Sat, 11 Jan 2014 13:52:56 -0800")
References: <CALo-6+gWgZ0Oj23CU7MzMtWGYShcL3uPcNUn5Mstj3GO=UCVMA@mail.gmail.com>
Message-ID: <87sist4mmd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 > This is more of a busybox then buildroot question, but please bear with me.
 > I have two designs now in production using buildroot and need to accomplish a
 > few things that seem to be escaping me with busybox and would appreciate a bit
 > of advice.

 > 1. I would like to execute a couple of bash commands (killall and rmmod) when
 > the "reboot" command is executed. I *thougth* that I could add these to /etc/
 > inittab in the shutdown section, but they dont execute. Is there a way to
 > easily execute a couple of bash commands in busybox when the "shutdown" command
 > is executed?

Are you 100% sure they don't execute? E.G. try stracing init while you
execute reboot. The busybox init program executes the shutdown commands
nicely here.

 > 2. I cannot seem to export variables from /etc/init.d resource scripts. What
 > could be unique about a busybox environment that would preclude any script
 > executing in /etc/init.d to *not* export a variable. A clue or two would be
 > appreciated.

export to where? Anything exported from /etc/init.d is gone when the
init script ends.

If you want to export variables globally, consider adding it to
/etc/profile (or better create a /etc/profile/<whatever>.sh)

-- 
Bye, Peter Korsgaard
