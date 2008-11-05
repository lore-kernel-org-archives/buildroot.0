From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Nov 2008 20:15:36 +0100
Subject: [Buildroot] [PATCH] Make the MESSAGE Macro work
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C91CCD@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Wed\,
	5 Nov 2008 12\:16\:02 -0500")
References: <BD79186B4FD85F4B8E60E381CAEE1909C91CCD@mi8nycmail19.Mi8.com>
Message-ID: <878wryoug7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

 hartleys> Hello all,
 hartleys> The following patch makes the MESSAGE Macro in Makefile.autotools.in
 hartleys> work.

 hartleys> I think it was originally intended to print the messages in bold type
 hartleys> but it doesn't appear to work correctly. This patch should work on all
 hartleys> platforms.
 
 hartleys>  # MESSAGE Macro -- display a message in bold type
 hartleys>  MESSAGE = @echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
 hartleys> $(1)$(TERM_RESET)"
 hartleys> -TERM_BOLD = #$(shell tput bold)
 hartleys> -TERM_RESET = #$(shell tput rmso)
 hartleys> +TERM_BOLD = $(shell tput smso)
 hartleys> +TERM_RESET = $(shell tput rmso)

These should probably be := so we don't end up with tons of tput
calls.

-- 
Bye, Peter Korsgaard
