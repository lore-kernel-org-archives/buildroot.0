From: Peter Sanford <psanford@nearbuysystems.com>
Date: Tue, 7 Jan 2014 15:07:18 -0800
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <52CC7292.306@alcatel-lucent.com>
References: <52CC7292.306@alcatel-lucent.com>
Message-ID: <CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ed,

I've run into this issue on a different SOC. In my case the problem was my
target architecture variant was set to one newer than what my cpu actually
was.

I stopped looking into the problem after I discovered this, so I don't have
a good understanding of *why* it failed in this manner.

If you can send the buildroot config and more details about your SOC that
might help.

Good luck,

-psanford


On Tue, Jan 7, 2014 at 1:33 PM, Ed Sutter <ed.sutter@alcatel-lucent.com>wrote:

> Hi,
> I'm using buildroot for the first time to set up rootfs on an iMX6
> based platform.  I've been debugging a startup issue and just realized
> that the the line...
>
> >
> >for i in /etc/init.d/S??* ;do
> >
> in /etc/init.d/rcS is failing because "S??*" is not being replaced by
> the files that match that expression.  Then I just tried doing something
> simple on the command line...
>
> >
> >#  ls /bin/m*
> >ls: /bin/m* : No such file or directory
> >
>
> and I see that fails as well.  I'm guessing this is some kind of busybox
> configuration (regex/readline/etc..) issue, but since I got it all through
> buildroot,
> I figured I'd try here first.
> Any ideas?
> Thanks in advance,
> Ed
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140107/7075123e/attachment.html>
