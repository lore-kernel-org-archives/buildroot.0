From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Dec 2010 16:30:31 -0500
Subject: [Buildroot] [PATCH v2] rsh-redone: new package for rsh/rlogin
	clients
In-Reply-To: <87ei9ts2jk.fsf@macbook.be.48ers.dk>
References: <1290122441-7320-1-git-send-email-vapier@gentoo.org>
	<201012071554.58601.vapier@gentoo.org>
	<87ei9ts2jk.fsf@macbook.be.48ers.dk>
Message-ID: <201012071630.31741.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, December 07, 2010 16:20:31 Peter Korsgaard wrote:
>  >> Does this do anything else than just copying the binaries? If not, it
>  >> might be simpler to just do a
>  >> 
>  >> for i in $(rsh-redone-bin-y); do $(INSTALL) -m 755 -D $$i
>  >> $(TARGET_DIR)/usr/bin/$$i; done for i in $(rsh-redone-sbin-y); do
>  >> $(INSTALL) -m 755 -D $$i $(TARGET_DIR)/usr/sbin/$$i; done
> 
>  Mike> i prefer to let the package build system do these simple steps to
>  Mike> avoid worrying about changes in between version bumps.  this
>  Mike> proposal for examples misses set*id on the binaries, and i'm not
>  Mike> entirely sure it is more simple.
> 
> setuid/setgid wouldn't work anyway, as we don't do make install as
> root. For that kind of stuff you have to define it in device_table.txt
> like it's done for busybox.

sounds like a limitation in the build system somewhere.  the file is certainly 
installed into output/target/ with set*id.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101207/83f3f9b1/attachment-0001.pgp>
