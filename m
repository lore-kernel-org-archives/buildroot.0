From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 23:03:25 +0100
Subject: [Buildroot] [PATCH] toochain/wrapper: fix potential bug in
	foreach loop
In-Reply-To: <1445462467-26873-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 21 Oct 2015 23:21:07 +0200")
References: <1445462467-26873-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <871tcifvwy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In Makefile, the comma ',' is used to separate the arguments passed to
 > functions, so we should not be allowed to use straight commas in strings
 > we want to expand.

 > For the toolchain wrapper, we need to transform a list:
 >     -mfoo -mbar -mbuz

 > into something acceptable for a C array assignment:
 >     "-mfoo", "-mbar", "-mbuz",

 > So, we use a $(foreach ...) loop for that. However, we do have a
 > straight comma in there.

 > It does not cause any issue in practice, since $(foreach) is a make
 > builtin function that accepts three and only three parameters.

 > However, this is not sane.

 > Change the straight comma to the usual $(comma) expansion, like we sould
 > do for a call to any other function.

 > At the same time, make the code a bit easier to read, by first creating
 > the transformed list, and then creating the define.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
