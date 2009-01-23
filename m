From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 10:11:28 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
In-Reply-To: <1232650901.5311.15.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 22 Jan 2009 20\:01\:41 +0100")
References: <20090122075324.D71DA765E9@busybox.osuosl.org>
	<874ozrpv1k.fsf@macbook.be.48ers.dk>
	<1232650901.5311.15.camel@elrond.atmel.com>
Message-ID: <87ocxymlof.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> Please don't do that. That's not a common use case. If you want to
 >> test everything, just use make allyesconfig instead.

 Ulf> I agree that it is not a common test case, but I don't want to
 Ulf> test everything as well at this point.

 Ulf> ?It is a help to test, but I agree it should be removed 
 Ulf> before the final distribution, or significantly improved.

Then please keep it in your local tree instead.

 Ulf> Right now, It saves a lot of time in the testing process.

 Ulf> Easiest is just to replace it with an empty file when
 Ulf> the distribution is made.

No, that sounds dirty.

Why don't you just do a make allyesconfig and either use the
KCONFIG_ALLCONFIG stuff to disable specific packages, or simply run
sed on your .config instead? You could probably add it to your
buildall script.

-- 
Bye, Peter Korsgaard
