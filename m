From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Sep 2008 20:57:10 +0200
Subject: [Buildroot] directive without effect
In-Reply-To: <200809071913.19696.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sun\, 7 Sep 2008 19\:13\:19 +0200")
References: <200809071913.19696.markus.heidelberg@web.de>
Message-ID: <87vdx7pywp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> Hello,

 Markus> revision r19279 from 27.07.2007 uses an invalid variable name
 Markus> CONFIG_BR2_PACKAGE_LINUX, so that the if-statement is always
 Markus> false. I don't know the state, when the change was commited,
 Markus> so I'm not sure what to do.

 Markus> a) remove CONFIG_ because BR2_PACKAGE_LINUX does exist
 Markus> b) revert the commit as it apparently didn't cause problems
 Markus> without setting HOST_SOURCE

A seems to me to be the correct thing to do - The reason why there
haven't been any bug reports is that the line is only used when 'make
source' is used (E.G. for downloading all package sources in advance
so you can do the rest of the work offline), which is probably not a
really common thing to do ..

I'll commit a fix.

-- 
Bye, Peter Korsgaard
