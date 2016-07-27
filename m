From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 15:02:30 +0200
Subject: [Buildroot] [PATCH v3] configs/warpboard: Generate an sdcard
	image
In-Reply-To: <1469548911-23770-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Tue, 26 Jul 2016 13:01:51 -0300")
References: <1469548911-23770-1-git-send-email-festevam@gmail.com>
Message-ID: <87r3afxmhl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > From: Fabio Estevam <fabio.estevam@nxp.com>
 > Generate an sdcard.img image to make it easier the deployment of a
 > Buildroot image.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
 > ---
 > Changes since v2:
 > - Fix post-image.sh permission
 > Changes since v1:
 > - Adjust the prefix in the Subject
 > - Adjust the README file to include the eMMC sdcard.img flashing procedure
 > and the new files (rootfs.ext4 and sdcard.img)


 > +++ b/board/freescale/warpboard/post-image.sh
 > @@ -0,0 +1,16 @@
 > +#!/usr/bin/env bash
 > +
 > +BOARD_DIR="$(dirname $0)"
 > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 > +
 > +rm -rf "${GENIMAGE_TMP}"
 > +
 > +genimage \
 > +  --rootpath "${TARGET_DIR}" \
 > +  --tmppath "${GENIMAGE_TMP}" \
 > +  --inputpath "${BINARIES_DIR}" \
 > +  --outputpath "${BINARIES_DIR}" \
 > +  --config "${GENIMAGE_CFG}"
 > +
 > +exit $?

The exit statement isn't needed. Committed after removing it, thanks.

-- 
Bye, Peter Korsgaard
