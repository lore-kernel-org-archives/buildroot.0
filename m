From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 22:04:40 +0100
Subject: [Buildroot] [PATCH v2] linux: strip installed modules
In-Reply-To: <1290038143-17595-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Wed, 17 Nov 2010 18:55:43 -0500")
References: <87oc9nad27.fsf@macbook.be.48ers.dk>
	<1290038143-17595-1-git-send-email-vapier@gentoo.org>
Message-ID: <87r5ea4emv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The installed kernel modules should have useless build cruft
 Mike> stripped out of them.  On my system, a default build went from a
 Mike> very unreasonable 30MB to a normal 3MB (on disk) and from 14MB to
 Mike> 3MB when compressed due to the info stored in the kernel modules
 Mike> alone.

Committed with a small change to not use binutils strip specific options
(we support sstrip as well).

-- 
Bye, Peter Korsgaard
