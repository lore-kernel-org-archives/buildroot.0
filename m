From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 6 Jan 2013 11:29:54 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <50E8E406.60407@je-eigen-domein.nl>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <50E8E406.60407@je-eigen-domein.nl>
Message-ID: <CAGduivyHwE9-WZPvL8BoGUTp=wXZ4=nA+vrrbCs5-UCRf7MFkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 6, 2013 at 3:40 AM, Floris Bos <bos@je-eigen-domein.nl> wrote:
> On 01/05/2013 03:10 PM, Maxime Hadjinlian wrote:
>>
>> Introducing a package to install pre-built binaries for the bootloader and
>> the
>> GPU firmware for the RaspberryPi board.
>
>
> Fails to install.
> You need to create the target/boot directory first.
>
Thanks, I was using a custom skeleton, forgot to get rid of it to try out.
> ==
>
> /usr/bin/install -D -m 0644
> /hdd/max/dev/tmp/buildroot/output/build/rpi-fw-76d0ac38f16b6343c6155c80db1e4758b3a5838a/boot/bootcode.bin
> /hdd/max/dev/tmp/buildroot/output/target/boot/
> /usr/bin/install: target `/hdd/max/dev/tmp/buildroot/output/target/boot/' is
> not a directory: No such file or directory
> make: ***
> [/hdd/max/dev/tmp/buildroot/output/build/rpi-fw-76d0ac38f16b6343c6155c80db1e4758b3a5838a/.stamp_target_installed]
> Error 1
> ==
>
>
> But another question would be if bootloader files really should be installed
> under target.
> Keep in mind that the Raspberry Pi boot files are normally kept on a FAT
> partition seperate from the root file system.
This question can't be solved right now but it's in the pipe, see a
mail by Yann E. Morin in the mailing list a few weeks ago.
>
>
> Yours sincerely,
>
> Floris Bos
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
