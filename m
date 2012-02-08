From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 22:18:31 +0100
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <4F32D55A.6010004@renta.net> (Mark Constable's message of "Thu,
 09 Feb 2012 06:04:42 +1000")
References: <CB5771EE.2EBB%donald.poole@swri.org> <4F321CF0.7000305@renta.net>
 <87bop9zrvp.fsf@macbook.be.48ers.dk> <4F32D55A.6010004@renta.net>
Message-ID: <87d39p3ty0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Constable <markc@renta.net> writes:

 Mark> Right, I was struggling to find the right inittab entry for a
 Mark> "normal" console login and had used /bin/login which seems to
 Mark> demand a non-root login.  Once I tried this it let me in as root
 Mark> without a password...

 Mark> tty1::respawn:/sbin/getty 38400 tty1

 Mark> It would have saved me a lot of time if this entry was in
 Mark> /etc/inittab, even if it was commented out.

We used to have hardcoded tty1/tty2 lines, but we removed those give
lots of error messages if the kernel isn't compiled with virtual
terminals support (which is fairly common on embedded) - See commit
7d9d09db673a.

It's hard to provide sensible defaults for everyone (E.G. names of
UART device nodes differ between boards), but atleast we have the '
We atleast provide the "Port to run a getty (login prompt) on" option
under System configuration to make it easy to configure.

-- 
Bye, Peter Korsgaard
