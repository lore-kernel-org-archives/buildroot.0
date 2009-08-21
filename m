From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Aug 2009 11:44:47 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
	<20090819233037.1d8e5a5d@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
	<20090820143514.7c5e56a2@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com>
Message-ID: <20090821114447.188fc839@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for all your researches, they are very interesting.

Le Thu, 20 Aug 2009 20:53:33 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> The current external toolchain support doesn't appear to work
> correctly for a multilib toolchain. 

I've definitely never used multilib toolchains with the external
toolchain support. That's something that must be extended.

> Any ideas on how to make this work?

In the menuconfig, the CPU type can be specified in the ? Target
Architecture Variant ?, the value of this option can be used to call
-print-sysroot properly.

And as you said, the handling of ?Target Architecture Variant? is
currently incorrect for external toolchains.

Do you want me to work on this, or do you plan to work on it yourself ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
