From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 09 Feb 2012 22:57:54 +0100
Subject: [Buildroot] [PATCH 2 of 5 v6] dependencies: check minimal make
	version early on
In-Reply-To: <87k43v4szv.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Thu, 09 Feb 2012 22:05:56 +0100")
References: <patchbomb.1328718135@beantl019720>
 <524d33227f44ddf99ac9.1328718137@beantl019720>
 <87k43v4szv.fsf@macbook.be.48ers.dk>
Message-ID: <87zkcr3c0t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> It seems simpler to just compare with MAKE_VERSION, so I changed it to
 Peter> be:

 Peter> ifeq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MAKE_VERSION))

Ehh, swap that:

ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))

Otherwise it would fail for 3.81.

-- 
Bye, Peter Korsgaard
