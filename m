From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 15:51:09 +0200
Subject: [Buildroot] Freetype not stripped on target
In-Reply-To: <20090330152730.5d36a4b1@surf> (Thomas Petazzoni's message of
	"Mon\, 30 Mar 2009 15\:27\:30 +0200")
References: <20090330152730.5d36a4b1@surf>
Message-ID: <8763hrazle.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Any reason for giving a specific value to FREETYPE_INSTALL_TARGET_OPT
 Thomas> instead of keeping the default ? The default is install-strip, which
 Thomas> would have installed a stripped version of the freetype library to the
 Thomas> target. Is this a problem ?

Well, the reason is:

make DESTDIR=/tmp/type install-strip              /tmp/freetype-2.3.9
make: *** No rule to make target `install-strip'.  Stop.

But I agree, we should add a $(STRIPCMD) to the
FREETYPE_HOOK_POST_INSTALL, will fix.

-- 
Bye, Peter Korsgaard
