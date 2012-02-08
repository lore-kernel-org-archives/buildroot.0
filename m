From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 8 Feb 2012 15:20:20 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <87aa4vt3tj.fsf@macbook.be.48ers.dk>
Message-ID: <CB57ED00.2EC7%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/7/12 3:01 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
> >> puts("Login incorrect");
> >> 
> >> As you're using the default fs skeleton, the pw_passwd[0] and
> >> /etc/securetty tests shouldn't fail, but apparently they do. Could you
> >> enable strace and run
> >> 
> >> strace -f login
> >> 
> >> And send the output to the list?
> >> 
> >> -- 
> >> Bye, Peter Korsgaard
>
> Donald> Ok, sorry for the delay, but I was tied up at work getting ready
>for a
> Donald> demo.  But, here is the strace output?it's quite long:
>
> Donald> 1292  execve("bin/login", ["bin/login"], [/* 8 vars */]) = 0
>
>I don't see "Login incorrect" anywhere in that log. Did you remember to
>use strace -f ?
>
>-- 
>Bye, Peter Korsgaard

I did use strace -f.  These are the steps I took.  I keep my inittab the
same (left ttymxc0::respawn:/sbin/getty -n -L ttymxc0 115200 vt100 -n -l
/bin/sh # GENERIC_SERIAL) so I could login without login prompt.  Then I
executed this strace command:

	strace -o strace.out -f /bin/login

Then I copied the contents of strace.out to the mailing list.  I actually
had to force a reboot of the system because the strace never terminated
because it was hung up somewhere and kept printing out this over and over
in the strace.out file:

	1292  ioctl(0, SNDCTL_TMR_CONTINUE or TCSETSF, {B115200 opost isig icanon
	echo ...}) = ? ERESTARTSYS (To be restarted)
	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---
	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---

Are the steps I took not sufficient? Or does the -o option interfere
somehow?

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
