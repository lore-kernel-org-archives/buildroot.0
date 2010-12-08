From: Pkun <serj.kalichev@gmail.com>
Date: Wed, 8 Dec 2010 13:40:17 +0300
Subject: [Buildroot] [PATCH] The external toolchain can be used
	statically.
In-Reply-To: <201012071908.32897.vapier@gentoo.org>
References: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
	<201012071908.32897.vapier@gentoo.org>
Message-ID: <AANLkTi=3xTccnF3MFe5NXjm3sMYctGRaeNzopbo_1dWF@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok.
May be the right way is to copy only
"/usr/lib/libnss*.so*" and
"/usr/lib/gconv"
when the static is preferred?

Or make the shared libraries copying optional in Config.in?
Or make checkboxes especially for libnss and conv libraries to force
copying?

P.S. Sorry for message duplication. Send this message to get to thread.




2010/12/8 Mike Frysinger <vapier@gentoo.org>

> On Tuesday, December 07, 2010 10:48:14 Serj Kalichev wrote:
> > I tried to build minimal busybox-only project for using as initramfs. I
> use
> > external buildroot toolchain. The buildroot copy the .so libraries from
> > external toolchain to the target dir unconditionally. But I build busybox
> > statically and don't need shared libraries (the size of resulted image is
> > too big with unneeded libraries).
>
> this isnt entirely correct.  glibc will still load shared libs on the fly
> such
> as nss and iconv.
> -mike
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/4824d582/attachment.html>
