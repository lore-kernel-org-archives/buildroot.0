From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 8 Feb 2012 23:17:36 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <87fwel8esq.fsf@macbook.be.48ers.dk>
Message-ID: <CB585E3C.2EF2%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/8/12 10:34 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
>Hi,
>
> >> Ok, but what happened to the "Login incorrect" line? Do you still get
> >> that printed to the serial port?
>
> Donald> No, that never was printed to the serial port.  After executing
> Donald> the strace command, it hung and kept printing out:
>
> Donald> 	1292  ioctl(0, SNDCTL_TMR_CONTINUE or TCSETSF, {B115200 opost
>isig icanon
> Donald> 	echo ...}) = ? ERESTARTSYS (To be restarted)
> Donald> 	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---
> Donald> 	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---
>
>But in your original email you told us that you were getting that
>error. What changed?
>
>-- 
>Bye, Peter Korsgaard

Ok, I found the problem. /bin/busybox wasn't setuid root. Changing the uid
to root fixed the problem.  I thought buildroot did this automatically
after installing to target?

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
