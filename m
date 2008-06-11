From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2008 11:31:02 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <484F8F05.2040105@gin.de> (Andreas Kuehn's message of "Wed\,
	11 Jun 2008 10\:38\:29 +0200")
References: <484F8157.2050902@gin.de> <87hcc0pfrr.fsf@macbook.be.48ers.dk>
	<484F8F05.2040105@gin.de>
Message-ID: <87lk1cmi7d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:

Hi,

 Andreas> That is how I found that thing. It simply doesn't fit into my boot
 Andreas> flash anymore.
 Andreas> And Yes, it is the same, not even a copy, .config file for both trys.

 Andreas> The reason why I need the "new" uclibc is, that I need access to the
 Andreas> PIOs of my at91sam9261 and at91sam9263 controllers. And the "old"
 Andreas> uclibc has this mmap bug that creates an page overflow error.

 Andreas> Is there a chance that something in the uclibc like the
 Andreas> LARGEFILESUPPORT creates some static or incompressable data block?

That doesn't sound likely. Are the vmlinux files also different in
sizes? Try comparing output of $CROSS-nm on the vmlinux files.

-- 
Bye, Peter Korsgaard
