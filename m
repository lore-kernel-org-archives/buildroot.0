From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 16 Apr 2008 14:20:34 +0200
Subject: [Buildroot] [patch] AVR32: rename atstk1002 target board
	to	more generic	atstk100x
In-Reply-To: <1208335958.23163.4.camel@localhost>
References: <1208335958.23163.4.camel@localhost>
Message-ID: <1208348434.8069.5.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-04-16 at 10:52 +0200, Hans-Christian Egtvedt wrote:
> Hi,
> 
> Please consider applying the linked patch:
> 
> http://www.atmel.no/~hcegtvedt/patches/0001-AVR32-rename-atstk1002-target-board-to-more-generic.patch
> 

Hmmm, nah, git format-patch did not do the trick for patch.

The patch below will work, but requires some manual hands-on.

http://www.atmel.no/~hcegtvedt/patches/0001-AVR32-rename-atstk1002-target-board-to-more-generic-take2.patch

patch -p1 < 0001-AVR32-rename-atstk1002-target-board-to-more-generic-take2.patch
~ > mv target/device/Atmel/atstk1002/* target/device/Atmel/atstk100x/
~ > rmdir target/device/Atmel/atstk1002

Then commit.

I update the two _defconfigs to reflect the changes.

> This patch renames the Atmel atstk1002 target board to a more generic
> atstk100x name. This to make it easier to add support for other
> CPU-boards than atstk1002.
> 
> Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
> 
> Applies clean to snapshot from 20080416.
> 

Should apply clean now.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
