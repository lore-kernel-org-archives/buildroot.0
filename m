From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 8 Feb 2012 16:25:38 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <87mx8t8fis.fsf@macbook.be.48ers.dk>
Message-ID: <CB57FCFF.2EDB%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/8/12 10:18 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
>Hi,
>
> >> I don't see "Login incorrect" anywhere in that log. Did you remember
>to
> >> use strace -f ?
>
> Donald> I did use strace -f.  These are the steps I took.  I keep my
> Donald> inittab the same (left ttymxc0::respawn:/sbin/getty -n -L
> Donald> ttymxc0 115200 vt100 -n -l /bin/sh # GENERIC_SERIAL) so I could
> Donald> login without login prompt.  Then I executed this strace
> Donald> command:
>
> Donald> 	strace -o strace.out -f /bin/login
>
> Donald> Then I copied the contents of strace.out to the mailing list.
> Donald> I actually had to force a reboot of the system because the
> Donald> strace never terminated because it was hung up somewhere and
> Donald> kept printing out this over and over in the strace.out file:
>
>Ok, but what happened to the "Login incorrect" line? Do you still get
>that printed to the serial port?
>
>-- 
>Bye, Peter Korsgaard

No, that never was printed to the serial port.  After executing the strace
command, it hung and kept printing out:

	1292  ioctl(0, SNDCTL_TMR_CONTINUE or TCSETSF, {B115200 opost isig icanon
	echo ...}) = ? ERESTARTSYS (To be restarted)
	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---
	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---

to the strace.out file.  I had to pull the power from the board and
restart the board in order since Ctrl-C or anything wouldn't work.

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
