From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Dec 2010 05:48:05 -0500
Subject: [Buildroot] [PATCH] The external toolchain can be used
	statically.
In-Reply-To: <AANLkTi=3xTccnF3MFe5NXjm3sMYctGRaeNzopbo_1dWF@mail.gmail.com>
References: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
	<201012071908.32897.vapier@gentoo.org>
	<AANLkTi=3xTccnF3MFe5NXjm3sMYctGRaeNzopbo_1dWF@mail.gmail.com>
Message-ID: <201012080548.05897.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, December 08, 2010 05:40:17 Pkun wrote:
> Ok.

please dont top post

> May be the right way is to copy only
> "/usr/lib/libnss*.so*" and
> "/usr/lib/gconv"
> when the static is preferred?

no, because that wont pull in the libraries that those libraries need.  like 
libc.so, libresolv.so, ld-linux.so, ......  at which point you might as well 
leave them alone.

> Or make the shared libraries copying optional in Config.in?
> Or make checkboxes especially for libnss and conv libraries to force
> copying?

i think the only safe way would be to let end users remove the files they know 
they wont need at runtime.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/098ded21/attachment.pgp>
