From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 22:16:14 +0100
Subject: [Buildroot] [PATCH] auto remove empty /usr/share dir
In-Reply-To: <1290115558-8915-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Thu, 18 Nov 2010 16:25:58 -0500")
References: <1290115558-8915-1-git-send-email-vapier@gentoo.org>
Message-ID: <87mxoy4e3l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Often times, the only reason /usr/share exists is because of
 Mike> documentation installed into it.  So once we're done cleaning the
 Mike> docs, attempt to rmdir /usr/share.  If it's empty, things will
 Mike> work out nicely.

Committed, thanks. I prefer to tell make to simply ignore the return
value rather than the '|| :' shell code though.

-- 
Bye, Peter Korsgaard
