From: Robin Mordasiewicz <rmordasiewicz@samuelmanutech.com>
Date: Tue, 19 Dec 2006 23:52:25 -0500 (EST)
Subject: [Buildroot] Booting the rootfs ext2 image
In-Reply-To: <20061220043858.GA29988@reid1.localdomain>
References: <7B808CFD-AB02-4E02-A220-CE241662C366@linux.it>
	<Pine.LNX.4.64.0612192322530.31862@smtcorms05.samuelmanutech.com>
	<20061220043858.GA29988@reid1.localdomain>
Message-ID: <Pine.LNX.4.64.0612192348340.31862@smtcorms05.samuelmanutech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Dec 2006, don wrote:
>> On Tue, 19 Dec 2006, Rafael A Barrero wrote:
>>
>>> Now that I've successfully built a rootfs image that includes my
>>> custom built kernel, I have a few questions about taking that rootfs
>>> and actually running it on my dev. system. I've mounted the ext2 fs
>>> as a loopback device and it looks great, but I'm looking for some
>>> pointers on getting grub configured for that partition.
>
> I booted mine with PXE and then ran grub to install on to the CF card
> in an IDE adapter.
>
> I believe you can install a disk or flash card onto your host and then
> run grub there with arguments to install there instead of your main
> hard drive.  But I didn't want to fight through that when I had PXE
> working.
>
> It does not boot from the CF card.

I am about to get to that point but I will be using a slightly different 
aproach. I am building an installer for thinstation(sourceforge project) 
which uses syslinux instead of grub or lilo.

In your case I would expect it to work as well. Are you basically doing 
something like the following ?

1. fdisk the CF
2. format the CF
3. copy root filesystem including kernel etc. to CF
4. chroot to new filesystem
5. run grub installer
