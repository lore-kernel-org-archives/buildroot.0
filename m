From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 6 Jan 2013 15:47:17 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <87d2xigzgj.fsf@dell.be.48ers.dk>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <50E8E406.60407@je-eigen-domein.nl> <87d2xigzgj.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivxAVfkwsmqjjk1JY7_gU70VmBrsUcVeEtzPtYUh70k1Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 6, 2013 at 3:26 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:
>
> Hi,
>
>  Floris> Fails to install.
>  Floris> You need to create the target/boot directory first.
>
>  Floris> ==
>
>  Floris> /usr/bin/install -D -m 0644
>  Floris> /hdd/max/dev/tmp/buildroot/output/build/rpi-fw-76d0ac38f16b6343c6155c80db1e4758b3a5838a/boot/bootcode.bin
>  Floris> /hdd/max/dev/tmp/buildroot/output/target/boot/
>  Floris> /usr/bin/install: target
>  Floris> /hdd/max/dev/tmp/buildroot/output/target/boot/' is not a directory: No
>  Floris> such file or directory
>  Floris> make: ***
>  Floris> [/hdd/max/dev/tmp/buildroot/output/build/rpi-fw-76d0ac38f16b6343c6155c80db1e4758b3a5838a/.stamp_target_installed]
>  Floris> Error 1
>  Floris> ==
>
> That's the point of using install -D (create dest dirs as needed), but
> you need to provide it with the destination file name as well - E.G
> $(TARGET_DIR)/boot/bootcode.bin
>
>  Floris> But another question would be if bootloader files really should be
>  Floris> installed under target.
>  Floris> Keep in mind that the Raspberry Pi boot files are normally kept on a
>  Floris> FAT partition seperate from the root file system.
>
> Indeed, it probably makes more sense to just put it in IMAGES_DIR
> instead.
How about putting them all in a rpi-firmware folder inside IMAGES_DIR
? I don't want to just throw them in this folder, it would be a pain
afterwards since they all go in the same place.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
