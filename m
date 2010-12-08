From: Pkun <serj.kalichev@gmail.com>
Date: Wed, 8 Dec 2010 14:26:52 +0300
Subject: [Buildroot] [PATCH] The external toolchain can be used
	statically.
In-Reply-To: <201012080548.05897.vapier@gentoo.org>
References: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
	<201012071908.32897.vapier@gentoo.org>
	<AANLkTi=3xTccnF3MFe5NXjm3sMYctGRaeNzopbo_1dWF@mail.gmail.com>
	<201012080548.05897.vapier@gentoo.org>
Message-ID: <AANLkTikEM07Fz7fe7C9LRt0--ysT7Ck__BUiyYTjeoHj@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What about checkbox "Don't copy toolchain libraries to the target dir" that
depends on PREFERRED_STATIC. So users who use dynamic linking don't see this
checkbox at all. But users who use static linking can manually choose to
copy or don't copy shared libraries. It's usefull to create initramfs images
at least. It's unlikely that someone make initramfs with complex soft.
Usually it will be a static busybox.

2010/12/8 Mike Frysinger <vapier@gentoo.org>

> On Wednesday, December 08, 2010 05:40:17 Pkun wrote:
> > Ok.
>
> please dont top post
>
> > May be the right way is to copy only
> > "/usr/lib/libnss*.so*" and
> > "/usr/lib/gconv"
> > when the static is preferred?
>
> no, because that wont pull in the libraries that those libraries need.
>  like
> libc.so, libresolv.so, ld-linux.so, ......  at which point you might as
> well
> leave them alone.
>
> > Or make the shared libraries copying optional in Config.in?
> > Or make checkboxes especially for libnss and conv libraries to force
> > copying?
>
> i think the only safe way would be to let end users remove the files they
> know
> they wont need at runtime.
> -mike
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/6595aa47/attachment.html>
