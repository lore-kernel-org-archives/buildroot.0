From: Pkun <serj.kalichev@gmail.com>
Date: Wed, 8 Dec 2010 10:21:53 +0300
Subject: [Buildroot] Fwd: [PATCH] The external toolchain can be used
	statically.
In-Reply-To: <AANLkTikFg6m92-ovN5cf6E29-owMVLY_K20twJ1eqy66@mail.gmail.com>
References: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
	<201012071908.32897.vapier@gentoo.org>
	<AANLkTikFg6m92-ovN5cf6E29-owMVLY_K20twJ1eqy66@mail.gmail.com>
Message-ID: <AANLkTikmgoy6nj=P3Fv6kqbSYvUNBDMoaEJQSmhVXVvy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Pkun <serj.kalichev@gmail.com>
Date: 2010/12/8
Subject: Re: [Buildroot] [PATCH] The external toolchain can be used
statically.
To: Mike Frysinger <vapier@gentoo.org>


Ok.
May be the right way is to copy only
"/usr/lib/libnss*.so*" and
"/usr/lib/gconv"
when the static is preferred?

Or make the shared libraries copying optional in Config.in?
Or make checkboxes especially for libnss and conv libraries to force
copying?

2010/12/8 Mike Frysinger <vapier@gentoo.org>

On Tuesday, December 07, 2010 10:48:14 Serj Kalichev wrote:
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/515f01fa/attachment.html>
