From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 31 Aug 2015 20:53:11 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
 on first boot
In-Reply-To: <55E445CA.9030907@je-eigen-domein.nl>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
 <55E445CA.9030907@je-eigen-domein.nl>
Message-ID: <CA+sos78s_Gs9sfqk0QPMxkR2KM2WX67-TiHbT-4ejkP7+6zGQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Mon, Aug 31, 2015 at 2:17 PM, Floris Bos <bos@je-eigen-domein.nl> wrote:
> On 08/22/2015 10:01 PM, Beno?t Th?baudeau wrote:
>> Add init scripts to auto-expand the persistent rootfs on the first boot
>> to fill the medium.
>
>
> Wonder if it wouldn't be better to have a package section in buildroot for
> commonly used init scripts like this?
>
> I don't think resizing the rootfs is specific to only this board.
> And by making it a package you could do "depends on
> !BR2_TARGET_ROOTFS_INITRAMFS" instead of grep magic in the post build
> script.

That makes sense. It would do "depends on BR2_TARGET_ROOTFS_EXT2" and
select the required target utils. It would also have to ask the user
for the block device to use (or it could autodetect at runtime the
block device on which '/' is mounted). Should this be a new package,
or just new options in the ext2 rootfs menu? I think that the latter
makes more sense for now.

But regarding the "!BR2_TARGET_ROOTFS_INITRAMFS", it would not be
needed at all. This is only on RPi to make user choices easier by not
having to unselect ext4fs and the rootfs overlay besides selecting
initramfs. On RPi, we could just force users to select only one of
them, and say so in readme.txt, and there would be no rootfs overlay
to manage with this feature as new config options.

Best regards,
Beno?t
