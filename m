From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Apr 2016 22:38:29 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <20160422222551.700fdf70@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 22 Apr 2016 22:25:51 +0200")
References: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
 <8737qdtn10.fsf@dell.be.48ers.dk>
 <20160422222551.700fdf70@free-electrons.com>
Message-ID: <87twits7ju.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 22 Apr 2016 22:18:51 +0200, Peter Korsgaard wrote:

 >> Thanks. Aren't these basically identical to the rpi1/rpi2 variants
 >> (except for the genimage script)? Please rework it to simply add a
 >> raspberrypi3 symlink like we do for raspberrypi2.

 > Why do we even have a symlink? If all files are the same, why aren't we
 > referencing board/raspberrypi/ files from the raspberrypi2_defconfig?

Because of some magic in post-image.sh that looks at the dirname to
figure out what genimage configuration to use:

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"

According to git blame this comes from 8dd797a0549869 that you applied
;)

We could also solve it by passing an argument to the script using
BR2_ROOTFS_POST_SCRIPT_ARGS (or the generic genimage support stuff).

-- 
Venlig hilsen,
Peter Korsgaard 
