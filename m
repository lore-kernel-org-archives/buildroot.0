From: Christophe Lucas <clucas@rotomalug.org>
Date: Sat, 24 Mar 2007 10:06:16 +0100
Subject: [Buildroot] Problems loading buildroot image to CompactFlash
In-Reply-To: <16732d180703230747v38d9b4c7j1784554e9ed7a6a7@mail.gmail.com>
References: <16732d180703211509g47d56803q56f64dce7f02329b@mail.gmail.com>
	<20070321224109.GC5468@aon.at>
	<200703220739.52058.alexander.rigbo@acgnystrom.se>
	<16732d180703230747v38d9b4c7j1784554e9ed7a6a7@mail.gmail.com>
Message-ID: <20070324090616.GC7625@rotomalug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

William Somerset (williamsomerset at gmail.com) wrote:
> I'm probably missing something here since usually, I just have whatever
> flavor of Linux install grub for me but the directions I found on the net
> had me copy over the /boot directory I use currently to the flash card.  I'm
> using Sabayon Linux 3.2 with a 2.6.18-gentoo-r5 kernel.  The kernel was also
> created with genkernel.  This is probably going to be a problem, huh?
> 
> Is installing grub as easy and changing the root in the boot prompt and
> doing the correct 'install' line?
> 
> I'm trying to target either VIA EPIA boards with x86 CPUs or something like
> PCEngines WRAP or Soekris net4501.

Hi william,

If grub is installed. So you can mount your CF card, un-tar your tarball
in CF-mounted directorty. Then you install grub with something like :

	echo -e 'root (hd0,0)\nsetup (hd0)'|grub --batch

I have done this kind of command, but I don't remember exactly syntax.
man grub is your friend.

Hope this can help you.

Regards,

	- Christophe -
