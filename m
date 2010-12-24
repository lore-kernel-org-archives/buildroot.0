From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 24 Dec 2010 11:03:32 +0100
Subject: [Buildroot] [PATCH] v2 Add UBI image generation support.
In-Reply-To: <20101223135427.3876f009@surf>
References: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
	<20101223135427.3876f009@surf>
Message-ID: <4D146FF4.6090800@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thomas Petazzoni a ?crit :
>  * The other solution proposed below is to not add a new root
>    filesystem type, but rather add a post-processing step to the
>    rootfs.ubifs image when "Embed in UBI image" is selected. You end up
>    with rootfs.ubifs in $(O)/images, regardless of whether it is a
>    UBIFS filesystem image, or a complete UBI image.
>   
I took (what I think is) the OpenEmbedded approch: generates both a
.ubifs image and a .ubi one.
We (armadeus) are most of the time using the UBI image to update our
systems from U-Boot, but I think people might be interested in having at
the same time both UBI and UBIFS images in their tftpboot directory and
know the difference by looking at the filename.

Regards,
Julien
