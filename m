From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Dec 2010 19:08:31 -0500
Subject: [Buildroot] [PATCH] The external toolchain can be used
	statically.
In-Reply-To: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
References: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
Message-ID: <201012071908.32897.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, December 07, 2010 10:48:14 Serj Kalichev wrote:
> I tried to build minimal busybox-only project for using as initramfs. I use
> external buildroot toolchain. The buildroot copy the .so libraries from
> external toolchain to the target dir unconditionally. But I build busybox
> statically and don't need shared libraries (the size of resulted image is
> too big with unneeded libraries).

this isnt entirely correct.  glibc will still load shared libs on the fly such 
as nss and iconv.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101207/c4ca3415/attachment.pgp>
