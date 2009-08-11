From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 21:10:37 +0000 (UTC)
Subject: [Buildroot] [Bug 563] compiling Linux 2.30.2 for ARM with Atmel
	support
In-Reply-To: <bug-563-163@https.bugs.busybox.net/>
References: <bug-563-163@https.bugs.busybox.net/>
Message-ID: <20090811211037.AD024777E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=563


Ulf Samuelsson <ulf.samuelsson@atmel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Ulf Samuelsson <ulf.samuelsson@atmel.com>  2009-08-11 21:10:37 UTC ---
You need to check my personal git, where there is support for:

linux-2.6.30.2
u-boot-2009.08-rc1
at91bootstrap-2.12 (soon 2.13-rc1)

Bootstrap compiles on all supported boards.
Only loaded to a SAM9263EK booting from dataflash.

U_boot has been compiled on the SAM9263/SAM9G10/SAM9G45,
but only loaded to a SAM9263EK

Linux has been compiled for SAM9263/SAM9G10/SAM9G45,
but again only loaded to a SAM9263.

After some hassle I have gotten mplayer to play mp3 files
and I can also display jpeg pictures, although
the BGR LCD controller is not supported.
(mplayer assumes RGB)

I have added all the patches I have found on the linux arm mailing
list, except the MCI patches, but I hope to add them later.

It obviously needs more testing, but thats why we are working
in a collaborative project, right.



Personal gits are available at http://git.buildroot.net/

The git in question is:

git://git.busybox.net/~ulf/git/atmel-2009-08-rc2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
