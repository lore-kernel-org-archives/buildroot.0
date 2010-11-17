From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Nov 2010 21:51:44 +0100
Subject: [Buildroot] [PATCH] linux: strip installed modules
In-Reply-To: <1289919560-2280-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Tue, 16 Nov 2010 09:59:20 -0500")
References: <1289919560-2280-1-git-send-email-vapier@gentoo.org>
Message-ID: <87oc9nad27.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The installed kernel modules should have useless build cruft stripped out
 Mike> of them.  On my system, a default build went from a very unreasonable 30MB
 Mike> to a normal 3MB (on disk) and from 14MB to 3MB when compressed due to the
 Mike> info stored in the kernel modules alone.

Thanks. We're moving away from per-package stripping though, so I would
prefer to add it to the toplevel target-finalize step instead though -
E.G. something like

find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | xargs $(STRIPCMD) ..

Care to adjust the patch to do that instead?

-- 
Bye, Peter Korsgaard
