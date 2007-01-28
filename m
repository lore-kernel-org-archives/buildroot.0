From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 28 Jan 2007 16:25:32 +0100
Subject: [Buildroot] AVR32 patch (& others)
In-Reply-To: <563e01c742e2$fb5b8670$dcc4af0a@atmel.com>
References: <20070128111333.GO28221@aon.at>
	<563e01c742e2$fb5b8670$dcc4af0a@atmel.com>
Message-ID: <20070128152531.GR28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 28, 2007 at 02:38:00PM +0100, Ulf Samuelsson wrote:
>Hi Bernard,
>You said that you would commit the prepatory AVR32 patch as soon as
>the confusion of multiple sends was sorted out.

.. and as soon as other stuff which went in my queue earlier is done (or
any other stuff i decide to do for that matter. I do not mean to sound
harsh, but remember that i'm not one of those timesys people who get
money for providing support for Atmel. It is my time, i don't have any
board you're adding to play with, so my interrest in helping you is
purely voluntarily. Please keep this in mind, thanks).

Merged anyway (hope i picked the correct version. It would help if you
could put numbers in your patches, like, e.g.:
Atmel_Config.in.02.patch or the like.). Thanks.

>Still any problems?
>
>Also:
>    No reply on the "BSP" patch, the "TARGET_CFLAGS" and the "local"  patches.

BSP is a bug squashing party. It's fun but i don't want to party right
now ;)

The TARGET_CFLAGS is something that doesn't sound clean to me, fwiw:
Put them into TARGET_CONFIGURE_OPTS for a start. Then build _all_
packages to see if you broke something. For those packages that still do
not pick up the TARGET_CFLAGS properly, additionally pass
TARGET_CONFIGURE_OPTS to the $(MAKE) in the respective packages I'd say.
