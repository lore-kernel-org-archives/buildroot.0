From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 15:38:54 +0100
Subject: [Buildroot] [PATCH 1/1] board/ci20: Implement creation of a
 basic sdcard image for ci20
In-Reply-To: <1515504542-26528-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1515504542-26528-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20180109153854.774a0b7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 14:29:02 +0100, Johannes Schmitz wrote:
> Add a genimage.cfg and post-image.sh to create a working sdcard.img for
> the ci20 hardware. We also need a uboot-env.txt to create the partition
> for the uboot environment.
> 
> Update the board/ci20/readme.txt with the related information. Remove
> the tftp netboot description from the readme as it is already to
> complicated for a basic bootable example.
> 
> Fix the toolchain-wrapper to support more recent GCC versions concerning
> the MIPS XBurst architecture used by ci20.
> 
> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>

Thanks for this new iteration!

> ---
>  board/ci20/genimage.cfg        | 29 +++++++++++++++++++++++
>  board/ci20/post-image.sh       | 16 +++++++++++++

This script is no longer needed/used by your patch, since you use the
generic genimage.sh script.

>  board/ci20/readme.txt          | 54 +++++++++++++++++++++++-------------------
>  board/ci20/uboot-env.txt       | 10 ++++++++
>  configs/ci20_defconfig         | 11 +++++++++
>  toolchain/toolchain-wrapper.c  | 10 ++++++--
>  toolchain/toolchain-wrapper.mk |  6 ++++-

The toolchain changes are really unrelated, they shouldn't be part of
the same patch.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
