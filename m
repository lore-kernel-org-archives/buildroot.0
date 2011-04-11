From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 11 Apr 2011 23:14:52 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <4DA369FA.8050505@michaelburghart.de>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de>
Message-ID: <BANLkTime4xLnnmc31J-SUBj0mLgoAxFCnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 April 2011 22:52, Michael Burghart <mb@michaelburghart.de> wrote:
> Am 11.04.2011 22:10, schrieb Michael Burghart:
> I set this in .config:
>
> BR2_ROOTFS_SKELETON_CUSTOM=y
> BR2_ROOTFS_SKELETON_CUSTOM_PATH="/Save/buildroot-2011.02/fs/skeleton"
>
>
> but it's not used! I made special directories and files in the
> fs/skeleton but they are nowhere to be seen. What do I have to do to
> make them visible??

Buildroot has a quirk: the rootfs skeleton is copied to the target dir
only once(!). If you change any files in ./fs/skeleton (or your custom
path) you have to do "make clean" and start over (or hack the
Makefile, around line 420...).

Best regards,
Bj?rn Forsman
