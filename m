From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 14 Apr 2011 15:40:09 -0700
Subject: [Buildroot] Switching to /dev/ttyX
In-Reply-To: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
References: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
Message-ID: <BANLkTinoehuK5-xrtQSKyAVu3BdChV7HmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What I am currently doing is commenting out the three tty's, tty1, tth2 &
tty3 and then uncommenting ttyS0 in /etc/inittab on the mounted root
filesystem.

I would appreciate some discussion from someone who is familiar with the
location of /etc/inittab in buildroot's build so we could modify it before
the rootfs is created.



On Thu, Apr 14, 2011 at 12:50 AM, Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> wrote:

> Hi,
>
> In /etc/inittab, you have e.g.
>
> tty1::respawn:/sbin/getty 38400 tty1
> tty2::respawn:/sbin/getty 38400 tty2
> tty3::respawn:/usr/bin/tail -f /var/log/messages
>
> By default I'm connected to the board on a serial line, e.g. /dev/ttyS0
>
> My question is: how can I access the other /dev/tty's?
> I tried the chvt command, but that does nothing: the command just
> completes but nothing changes on the shell.
>
> 'tty' always shows /dev/ttyS0.
>
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110414/7f2f70d1/attachment.html>
