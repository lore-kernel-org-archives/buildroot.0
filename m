From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 1 Mar 2012 16:11:32 +0100
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <87d39p3ty0.fsf@macbook.be.48ers.dk>
References: <CB5771EE.2EBB%donald.poole@swri.org> <4F321CF0.7000305@renta.net>
 <87bop9zrvp.fsf@macbook.be.48ers.dk> <4F32D55A.6010004@renta.net>
 <87d39p3ty0.fsf@macbook.be.48ers.dk>
Message-ID: <CAHQn0kikhv8RX1UZpY-VzN8o6DS4pZVxT+EUM39BBVZJrm0wew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 8, 2012 at 10:18 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Mark" == Mark Constable <markc@renta.net> writes:
>
> ?Mark> Right, I was struggling to find the right inittab entry for a
> ?Mark> "normal" console login and had used /bin/login which seems to
> ?Mark> demand a non-root login. ?Once I tried this it let me in as root
> ?Mark> without a password...
>
> ?Mark> tty1::respawn:/sbin/getty 38400 tty1
>
> ?Mark> It would have saved me a lot of time if this entry was in
> ?Mark> /etc/inittab, even if it was commented out.
>
> We used to have hardcoded tty1/tty2 lines, but we removed those give
> lots of error messages if the kernel isn't compiled with virtual
> terminals support (which is fairly common on embedded) - See commit
> 7d9d09db673a.
>
> It's hard to provide sensible defaults for everyone (E.G. names of
> UART device nodes differ between boards), but atleast we have the '
> We atleast provide the "Port to run a getty (login prompt) on" option
> under System configuration to make it easy to configure.

If you put this line in /etc/inittab it will create a login prompt on
the same port as set as console in kernel cmdline:

::respawn:-/bin/login

Are there any reasons having getty in between?
