From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Nov 2010 10:34:38 +0100
Subject: [Buildroot] [PATCH] tcpdump: punt duplicate versioned binary
In-Reply-To: <1290902120-12063-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Sat, 27 Nov 2010 18:55:20 -0500")
References: <1290902120-12063-1-git-send-email-vapier@gentoo.org>
Message-ID: <878w0czd5d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The tcpdump packag likes to install two binaries into /usr/sbin --
 Mike> one named "tcpdump" and one named "tcpdump.<ver>".  But it does this
 Mike> by installing the file twice rather than using links.  Since the alt
 Mike> name is useless to us, just punt it.

Committed with a small change to use POST_INSTALL_TARGET_HOOKS instead,
thanks.

-- 
Bye, Peter Korsgaard
