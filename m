From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Dec 2012 17:10:08 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
Message-ID: <20121211171008.3b869509@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Tue, 11 Dec 2012 16:09:46 +0100, Willy Lambert wrote:

> I did this again from another machine
> (silvie at silvie-VirtualBox:~/buildroot-2012.11$ uname -a
> Linux silvie-VirtualBox 3.2.0-34-generic-pae #53-Ubuntu SMP Thu Nov 15
> 11:11:12 UTC 2012 i686 i686 i386 GNU/Linux)
> 
> In short :
> wget buildroot, tar -xf, make, a menuconfig pops, I exit and save
> config, make, wait a bit ... and it fails with the above error about
> large file system.
> 
> So I'm sure now that the default config has a problem with largefiles.
> I'm sorry I'm too new to investigate further. Should I open a bug
> ticket ?
> 
> I did not try other versions of gcc as proposed by Berns. But my gcc
> version is :
> ard at ard-host(10.0):/opt/buildroot/output/host/usr$
> ./x86_64-buildroot-linux-uclibc/bin/gcc --version
> gcc (Buildroot 2012.11-svn2-dirty) 4.6.3
> I wonder about the "svn2-dirty" tag.

Can you do:

	make clean
	rm .config
	make menuconfig / exit / save
	env > buildroot-fails.env
	make 2>&1 | tee buildroot-fails.log
	cp output/toolchain/uClibc-0.9.33.2/.config buildroot-fails.uClibc.config

And then put somewhere online (do *NOT* send them by e-mail on the
list, it will be too large) the buildroot-fails.env,
buildroot-fails.log and buildroot-fails.uClibc.config files.

I have just built the default Buildroot configuration on two Ubuntu
12.04 machines, with zero problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
