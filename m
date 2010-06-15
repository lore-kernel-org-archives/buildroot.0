From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jun 2010 09:10:46 +0200
Subject: [Buildroot] Buildroot 2010.05-rc3 released :: 2 build errors -
 lockfile-progs & gdb
In-Reply-To: <1275417022.1598.5.camel@ubuntu>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1275007047.6387.17.camel@ubuntu>
	<87vda5suz0.fsf@macbook.be.48ers.dk>
	<1275417022.1598.5.camel@ubuntu>
Message-ID: <20100615091046.7b268452@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 02 Jun 2010 04:30:22 +1000
Microbit_Ubuntu <microbit@virginbroadband.com.au> wrote:

> 2010.05 builds 100% fine now, except for the little snag with the gdb
> symlink. I'll see if I can figure out what the common denominator is,
> but I'm a bit stumped.
> 
> I find I still have to manually insert the folder
> 'arm-unknown-linux-uclibcgnueabi' with 'bin' as a subfolder under
> buildroot-2010.05/output/staging/usr

Can you give a .config or reproduction steps for this ?

> (ext toolchain built with CT-NG 1.6.1, alias used is 'arm-elf-xxx'

FWIW, arm-elf is a prefix typically used for bare-metal toolchains, but
here you're doing an uClibc/Linux toolchain, which is fairly different.
It probably doesn't cause particular problems but might be confusing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
