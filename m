From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Dec 2010 22:20:31 +0100
Subject: [Buildroot] [PATCH v2] rsh-redone: new package for rsh/rlogin
	clients
In-Reply-To: <201012071554.58601.vapier@gentoo.org> (Mike Frysinger's message
	of "Tue, 7 Dec 2010 15:54:57 -0500")
References: <1290122441-7320-1-git-send-email-vapier@gentoo.org>
	<1290145224-21076-1-git-send-email-vapier@gentoo.org>
	<87r5dtu9ht.fsf@macbook.be.48ers.dk>
	<201012071554.58601.vapier@gentoo.org>
Message-ID: <87ei9ts2jk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Tuesday, December 07, 2010 06:07:26 Peter Korsgaard wrote:
 Mike> +# requires PAM
 Mike> +#config BR2_PACKAGE_RSH_REDONE_RSHD
 Mike> +#	bool "rshd"
 Mike> +#	depends on BR2_PACKAGE_RSH_REDONE
 >> 
 >> How useful is this without the server part?

 Mike> i use rshd from inetutils.  ive never tested rshd from this since
 Mike> it requires pam (as already documented).  someone else can if
 Mike> they care.

Ok.

 >> Does this do anything else than just copying the binaries? If not, it
 >> might be simpler to just do a
 >> 
 >> for i in $(rsh-redone-bin-y); do $(INSTALL) -m 755 -D $$i
 >> $(TARGET_DIR)/usr/bin/$$i; done for i in $(rsh-redone-sbin-y); do
 >> $(INSTALL) -m 755 -D $$i $(TARGET_DIR)/usr/sbin/$$i; done

 Mike> i prefer to let the package build system do these simple steps to
 Mike> avoid worrying about changes in between version bumps.  this
 Mike> proposal for examples misses set*id on the binaries, and i'm not
 Mike> entirely sure it is more simple.

setuid/setgid wouldn't work anyway, as we don't do make install as
root. For that kind of stuff you have to define it in device_table.txt
like it's done for busybox.

-- 
Bye, Peter Korsgaard
