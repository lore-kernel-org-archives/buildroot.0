From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jul 2013 08:01:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6392] Extended ARM uImage kernel options
In-Reply-To: <bug-6392-163@https.bugs.busybox.net/>
References: <bug-6392-163@https.bugs.busybox.net/>
Message-ID: <20130717080141.512679A5FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6392

--- Comment #3 from Philipp Rahns <philipp.rahns@meinberg.de> 2013-07-17 08:01:49 UTC ---
(In reply to comment #2)
> Thanks for this contribution.
> 
> Can you give examples of usage of BR2_LINUX_KERNEL_MAKE_FLAGS ? Why would it be
> limited to ARM and uImage ?
> 
> Also, I don't quite understand BR2_LINUX_KERNEL_NATIVE_CONFIG. When you unpack
> a kernel tarball or a Git tree, there's normally no .config in the kernel tree,
> and it has to be created, either starting from a defconfig, or using one of the
> menuconfig/nconfig/gconfig/xconfig configuration interfaces.
> 
> Could you expand a bit on the use cases? Thanks!

Hi Thomas,

I agree on the first one that it is not neccessarily limited to the ARM
section.
Could be used at any time when compiling a kernel in general.

Concerning native config:
When you have a look at the Zedboard or the Raspberry Pi there are already
modified kernel sources fitting to the board.
In some cases this is not enough for the requirements of oneself and you start
tweaking it. This is the point where you start "branching" the project and
saving ( mostly likely ) the config related to your changes. Of course, you
host this branch on a server and to make life easier for other developers you
provide an out of the box solution. I know I could easily use
"$(LINUX_DIR)/.config" as config file path but I though it was worth a single
option.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
