From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Jan 2009 21:43:10 +0100
Subject: [Buildroot] shell issues when /bin/sh is 'dash' instead
	of	'bash'
In-Reply-To: <20090101023620.GA13399@cloud.net.au> (Hamish Moffatt's message
	of "Thu\, 1 Jan 2009 13\:36\:21 +1100")
References: <bbbeeccd0812311504p2e7f96a6l923c938acac8acf0@mail.gmail.com>
	<20090101023620.GA13399@cloud.net.au>
Message-ID: <87eizm3ggx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 Hamish> On Wed, Dec 31, 2008 at 04:04:37PM -0700, Wade Berrier wrote:
 >> The result is that some files don't get installed into the target
 >> system when /bin/sh points to dash (like on recent ubuntu and debian?
 >> distros)
 >> 
 >> Attached is a patch to use CONFIG_SHELL.

 Hamish> Why aren't we setting SHELL=$(CONFIG_SHELL) somewhere, rather
 Hamish> than using $(CONFIG_SHELL) explicitly in each place? (And why
 Hamish> do I have the feeling we've had this discussion before?)

Because we already discussed it earlier ;) - Without any
conclusion. The CONFIG_SHELL afaik comes from the kconfig legacy, but
other projects like U-Boot have recently skipped it and simply set
SHELL.

I have done it as well for buildroot, and a test build seems to work
fine, so I'll commit it in a moment. We still need to set CONFIG_SHELL
though for the kconfig stuff (or fix their makefiles, but I would
prefer to keep the difference between us and upstream minimal).

 Hamish> Besides is CONFIG_SHELL guaranteed to be bash anyway?

No, it currently falls back to /bin/sh if bash isn't there. We should
probably add a check in dependencies.sh

 Hamish> Happy new year.

You too.

-- 
Bye, Peter Korsgaard
