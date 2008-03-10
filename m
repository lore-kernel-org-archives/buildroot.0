From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2008 22:26:12 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:  package
In-Reply-To: <00ab01c882f4$1dd68bd0$080514ac@atmel.com> (Ulf Samuelsson's
	message of "Mon\, 10 Mar 2008 22\:17\:05 +0100")
References: <20080310152243.544A212C5F4@busybox.net>
	<877iga5yy6.fsf@macbook.be.48ers.dk>
	<007c01c882ec$733d2960$080514ac@atmel.com>
	<87wsoa1fpk.fsf@macbook.be.48ers.dk>
	<00ab01c882f4$1dd68bd0$080514ac@atmel.com>
Message-ID: <87d4q21daj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> I might be wrong, since I didn't look at the patch, but it looks
 Ulf> to me that the patch will clean out the directory if unset.

 Ulf> If the switch is there, then the files should be copied to th
 Ulf> target directory.  If the switch was never there, then there
 Ulf> should not be any such files in the target directory.  If the
 Ulf> switch was there and is unset then I think the directory should
 Ulf> be cleaned out with an explicit command.

Sure, that's the nicest approach. But it also means every package .mk
needs to get fixed. This approach basically gives the same result with
only 4 lines or so of code.

So the basic system is here, but it can be refined by adding
HAVE_DEVFILES support to (library) packages (and the C library) one by
one. Once that is done this "dirty" solution can be removed.

Or we can simply decide it isn't worth it and stick with the current
solution.

-- 
Bye, Peter Korsgaard
