From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Oct 2017 12:40:13 +0200
Subject: [Buildroot] [PATCH 2/2] configs/atmel: addition of the sama5d27
	som1 ek board
In-Reply-To: <20171006100913.11480-1-nicolas.ferre@microchip.com> (Nicolas
 Ferre's message of "Fri, 6 Oct 2017 12:09:13 +0200")
References: <20171006100825.11378-1-nicolas.ferre@microchip.com>
 <20171006100913.11480-1-nicolas.ferre@microchip.com>
Message-ID: <87h8vcftki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Ferre <nicolas.ferre@microchip.com> writes:

 > Add the new SAMA5D27 SOM1 Evaluation Kit with linux4sam_5.7 components.
 > Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
 > ---
 >  board/atmel/sama5d27_som1_ek_mmc/genimage.cfg    | 34 ++++++++++
 >  board/atmel/sama5d27_som1_ek_mmc/post-image.sh   | 14 ++++
 >  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 85 ++++++++++++++++++++++++
 >  3 files changed, 133 insertions(+)
 >  create mode 100644 board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
 >  create mode 100755 board/atmel/sama5d27_som1_ek_mmc/post-image.sh
 >  create mode 100644 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig

 > new file mode 100755
 > index 000000000000..359b4c9e7c5e
 > --- /dev/null
 > +++ b/board/atmel/sama5d27_som1_ek_mmc/post-image.sh
 > @@ -0,0 +1,14 @@
 > +#!/bin/sh
 > +
 > +BOARD_DIR="$(dirname $0)"
 > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 > +
 > +rm -rf "${GENIMAGE_TMP}"
 > +
 > +genimage                               \
 > +	--rootpath "${TARGET_DIR}"     \
 > +	--tmppath "${GENIMAGE_TMP}"    \
 > +	--inputpath "${BINARIES_DIR}"  \
 > +	--outputpath "${BINARIES_DIR}" \
 > +	--config "${GENIMAGE_CFG}"

We nowadays have support/scripts/genimage.sh that could be used instead
of this post-image script - But ok, it is also not used by the other
atmel defconfigs.

Committed, thanks.

-- 
Bye, Peter Korsgaard
