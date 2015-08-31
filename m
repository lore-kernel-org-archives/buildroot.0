From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 31 Aug 2015 14:17:14 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
 on first boot
In-Reply-To: <1440273688-92868-4-git-send-email-benoit@wsystem.com>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
Message-ID: <55E445CA.9030907@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/2015 10:01 PM, Beno?t Th?baudeau wrote:
> Add init scripts to auto-expand the persistent rootfs on the first boot
> to fill the medium.

Wonder if it wouldn't be better to have a package section in buildroot 
for commonly used init scripts like this?

I don't think resizing the rootfs is specific to only this board.
And by making it a package you could do "depends on 
!BR2_TARGET_ROOTFS_INITRAMFS" instead of grep magic in the post build 
script.


Yours sincerely,

Floris Bos
