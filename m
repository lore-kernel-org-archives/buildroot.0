From: Robert Schwebel <r.schwebel@pengutronix.de>
Date: Mon, 24 Oct 2011 18:59:04 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111024173815.2277c6dd@skate>
References: <20111024173815.2277c6dd@skate>
Message-ID: <20111024165904.GB9199@pengutronix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Oct 24, 2011 at 05:38:15PM +0200, Thomas Petazzoni wrote:
> ELCE 2011 meeting agenda
> ========================

I cannot comment much about the buildroot specific things, being an
alien here :) However, some comments for topics where we might be able
to do some collaboration with the ptxdist + buildroot folks:

>  * Testing infrastructure. Possible to put build results on the Web
>    server? Common format for them?

This would surely be an interesting topic. We have worked on a test
infrastructure for ptxdist for a while now; in fact, we are in the 3rd
iteration:

- The first one was "expect" based. It failed because tcl is *just* so
  ugly, and the risk of getting eye cancer was simply too high ...

- The 2nd one was Python / pexpect based (failed because our method to
  connect the serial port's file descriptor to pexpect was discontinued
  some python minor revisions later). And it turned out that our initial
  idea to easily re-use tests due to the object orientation of Python
  didn't work, because the test adaptions to a scenario often are bigger
  then the test itself.

- We have a kermit based infrastructure now, with shell wrappers; the
  kermit code is ugly as hell, but it works reliably and is well
  wrapped.

If somebody is interested, I can show how we do that.

However, we also do not have the infrastructure for a sane
representation + website presentation of test results, so this is
definitely something where we might collaborate nicely.

>  * Next big directions. What are the next big directions for Buildroot
>    ? The major features we want to implement ?

Does buildroot have a possibility to split between runtime and build
time dependencies? This is something we are fighting with.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
