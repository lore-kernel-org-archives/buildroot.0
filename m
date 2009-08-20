From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2009 14:35:14 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
	<20090819233037.1d8e5a5d@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
Message-ID: <20090820143514.7c5e56a2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 19 Aug 2009 18:28:42 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> I just tried that and get the same results.  Maybe I didn't compile
> it statically?  I just did:
> 
> $ arm-none-linux-gnueabi-gcc init.c -o init

Add -static

And verify with "file" that it is indeed statically compiled:

thomas at surf:/tmp$ arm-linux-gcc -o hello hello.c
thomas at surf:/tmp$ file hello
hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
thomas at surf:/tmp$ arm-linux-gcc -o hello hello.c -static
thomas at surf:/tmp$ file hello
hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, not stripped

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
