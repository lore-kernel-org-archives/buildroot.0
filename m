From: bruce bushby <bruce.bushby@gmail.com>
Date: Tue, 8 Mar 2011 18:20:56 +0000
Subject: [Buildroot] Python: can't resolve symbol
In-Reply-To: <20110308110832.0b6f5869@surf>
References: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
	<20110308103159.2ca3d89b@surf>
	<AANLkTi==DMhkvCiKn+ZKdc=8003+qqaWOgQBf77GkgbV@mail.gmail.com>
	<20110308110832.0b6f5869@surf>
Message-ID: <AANLkTinQU-Kj4Ti-4cR6m9zGw4SyUCzTqcwRnEdVGc8B@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"..Reply to the list..."  Oops will make sure I reply all.


I think I've managed to replicate my issue, I've tested
two comparative builds which have a single difference:
(env)[veritrack at vdev01 images]$ diff buildroot-with-python-readline.config
buildroot-without-python-readline.config
4c4
< # Tue Mar  8 14:26:17 2011
---
> # Tue Mar  8 14:22:43 2011
445c445
< BR2_PACKAGE_PYTHON_READLINE=y
---
> # BR2_PACKAGE_PYTHON_READLINE is not set
568c568
< BR2_PACKAGE_READLINE=y
---
> # BR2_PACKAGE_READLINE is not set
(env)[veritrack at vdev01 images]$


I ran the build on both (Fedora 12) and (Ubuntu natty 11.04) and the results
are the same, when I select the Python "readline" module I get symbol errors
when launching a python shell. The symbol errors don't appear to cause any
issues ....yet.

I've up laoded my config files and make logs if anybody else wants to try
and replicate the issue:
http://veritrack.co.uk/static/images/buildroot_without_python_readline.config.txt
http://veritrack.co.uk/static/images/buildroot_without_python_readline.makelog.txt
http://veritrack.co.uk/static/images/buildroot_without_python_readline.rootfs.tar.bz2
http://veritrack.co.uk/static/images/buildroot_with_python_readline.config.txt
http://veritrack.co.uk/static/images/buildroot_with_python_readline.makelog.txt
http://veritrack.co.uk/static/images/buildroot_with_python_readline.rootfs.tar.bz2


If you're using "make menuconfig" ...it's:  <packages....> <Interpreter....>
<Python modules><readline>


Thanks
Bruce













On Tue, Mar 8, 2011 at 10:08 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> Please reply to the list and not to me directly.
>
> On Tue, 8 Mar 2011 09:38:28 +0000
> bruce bushby <bruce.bushby@gmail.com> wrote:
>
> > I have seen one of my builds that doesn't have this issue....then I
> > changed something which started the issue.....and then I backed out
> > the change and the issue went away.....so I'm relatively shore I can
> > reproduce it....which if I remember correctly was caused by "readline"
> >
> > I'll get two comparative builds together and forward the urls to the
> > requested files.
>
> Ok, thanks. Without a way of reproducing the problem, it's hard to
> debug it and provide a fix for it.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/68408077/attachment.html>
