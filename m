From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 06 Jan 2013 03:40:06 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
Message-ID: <50E8E406.60407@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/2013 03:10 PM, Maxime Hadjinlian wrote:
> Introducing a package to install pre-built binaries for the bootloader and the
> GPU firmware for the RaspberryPi board.

Fails to install.
You need to create the target/boot directory first.

==

/usr/bin/install -D -m 0644 
/hdd/max/dev/tmp/buildroot/output/build/rpi-fw-76d0ac38f16b6343c6155c80db1e4758b3a5838a/boot/bootcode.bin 
/hdd/max/dev/tmp/buildroot/output/target/boot/
/usr/bin/install: target 
`/hdd/max/dev/tmp/buildroot/output/target/boot/' is not a directory: No 
such file or directory
make: *** 
[/hdd/max/dev/tmp/buildroot/output/build/rpi-fw-76d0ac38f16b6343c6155c80db1e4758b3a5838a/.stamp_target_installed] 
Error 1
==


But another question would be if bootloader files really should be 
installed under target.
Keep in mind that the Raspberry Pi boot files are normally kept on a FAT 
partition seperate from the root file system.


Yours sincerely,

Floris Bos
