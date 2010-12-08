From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Dec 2010 06:31:27 -0500
Subject: [Buildroot] [PATCH] The external toolchain can be used
	statically.
In-Reply-To: <AANLkTikEM07Fz7fe7C9LRt0--ysT7Ck__BUiyYTjeoHj@mail.gmail.com>
References: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
	<201012080548.05897.vapier@gentoo.org>
	<AANLkTikEM07Fz7fe7C9LRt0--ysT7Ck__BUiyYTjeoHj@mail.gmail.com>
Message-ID: <201012080631.28379.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, December 08, 2010 06:26:52 Pkun wrote:

again, please do not top post

> What about checkbox "Don't copy toolchain libraries to the target dir" that
> depends on PREFERRED_STATIC. So users who use dynamic linking don't see
> this checkbox at all. But users who use static linking can manually choose
> to copy or don't copy shared libraries. It's usefull to create initramfs
> images at least. It's unlikely that someone make initramfs with complex
> soft.

that's up to Peter, but anything you add will need to include warnings such as 
ive already spewed

> Usually it will be a static busybox.

even a static busybox could try to load those libraries depending on the nss 
configuration.  nss handles simple things like user/group look ups in 
/etc/passwd and /etc/group to more complicated like host resolving.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/faca16d7/attachment-0001.pgp>
