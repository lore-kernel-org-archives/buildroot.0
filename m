From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Sat, 10 Mar 2018 16:14:45 +0000
Subject: [Buildroot] Is there a way to automatically detect the minimum
 required BR2_TARGET_ROOTFS_EXT2_SIZE?
Message-ID: <CAFXrp_exNc=GtVqbuRmYqKiDNXgD+pawnCSmRH-1FrF2dxXgLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://stackoverflow.com/questions/49211241/is-there-a-way-to-automatically-detect-the-minimum-required-br2-target-rootfs-ex

I'm when making a big non-embedded image, I keep hitting the error:

    *** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)

and then I have to do a `du` on `output/target` to find out how big I
have to make `BR2_TARGET_ROOTFS_EXT2_SIZE`.

Is there a way to automate this, or a decent workaround?

Some workarounds I'm considering:

* put the big stuff under 9p:
https://superuser.com/questions/628169/how-to-share-a-directory-with-the-host-without-networking-in-qemu
* use CPIO and `-initrd`
