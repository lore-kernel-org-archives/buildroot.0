From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:49:53 +0100
Subject: [Buildroot] [PATCH RFC] linux: fix recursively defined variable
In-Reply-To: <1418678350-6197-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 15 Dec 2014 22:19:10 +0100")
References: <1418678350-6197-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vblck2gu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When running 'make printvars', the output stops at the time we dump the
 > Linux related variables, with:

 >     linux/linux.mk:109: *** Recursive variable `LINUX_TARGET_NAME'
 >     references itself (eventually).  Stop.

 > And that's expected, since we have:

 >     109 LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
 >     [...]
 >     112 ifeq ($(LINUX_IMAGE_NAME),)
 >     113 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 >     114 endif

 > Even though they are defined in a way that ensures they are in fact not
 > recursively defined (the if-block ensures that), 'printvars' does dump
 > all our variables by evaluating all of them, which in that specific case
 > implies they are recursively defined.

 > Fix that by explicitly setting LINUX_IMAGE_NAME in each if-block.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
