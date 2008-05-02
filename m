From: John Voltz <john.voltz@gmail.com>
Date: Fri, 2 May 2008 07:32:18 -0400
Subject: [Buildroot] Cannot login a shell
In-Reply-To: <96471.16332.qm@web94105.mail.in2.yahoo.com>
References: <96471.16332.qm@web94105.mail.in2.yahoo.com>
Message-ID: <46a136670805020432q7e9e00c1p78e278ad509a5da4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tiju,

Edit /etc/inittab and comment out any getty's and add this:

ttyS0::respawn:-/bin/sh (if you are using a serial port)

or

tty0::respawn:-/bin/sh (if you are using a regular console)

then change the root password:

passwd root

This should hopefully get you in. If not, you might have some other problem.

John

On Fri, May 2, 2008 at 3:35 AM, Tiju Jacob <jacob_tiju@yahoo.com> wrote:

> Hi Erik,
>
> I have compiled a kernel, version linux-2.6.24.4 using the toolchain at
> http://cross-lfs.org/view/clfs-sysroot/arm/ which is not a uClibc version.
> Then I have compiled a cpio file system using buildroot which has it own
> version of uClibc.
>
> When I try to boot these images, I am not able to login. It comes back to
> the same login prompt when I login as root.
>
> Output:
> ....
> ....
> NET: Registered protocol family 1
> NET: Registered protocol family 17
> registered taskstats version 1
> Freeing init memory: 1108K
>
> Welcome to the Erik's uClibc development environment.
> uClibc login: root
>
> Welcome to the Erik's uClibc development environment..
> uClibc login:
>
>
>
> Ihave tried compiling with different versions but it remains the same.It
> actually spawns a shell, but it comes back to the login. It is thesame with
> busybox as well as bash.
>
> Kindly help me.
>
> Thanks in Advance.
> Tiju
>
>
>
>      Meet people who discuss and share your passions. Go to
> http://in.promos.yahoo.com/groups/bestofyahoo/
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080502/95047217/attachment.htm 
