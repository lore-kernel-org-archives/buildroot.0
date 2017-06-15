From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:15:08 +0200
Subject: [Buildroot] [PATCH] board: Add nanopi-m1 Support
In-Reply-To: <1497547465-15445-1-git-send-email-chakra@openedev.com>
References: <1497547465-15445-1-git-send-email-chakra@openedev.com>
Message-ID: <20170615221508.27a297ab@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Jun 2017 22:54:25 +0530, Chakra Divi wrote:
> Add initial support for nanopi-m1 board
> with below features
> - U-Boot 2017.07-rc1

Are you using this -rc1 because it's the first U-Boot version with
support for this board?

> - Linux 4.11
> - Default packages from buildroot
> 
> Created a new folder nanopi under buildroot
> board; any new board for nanopi can be added
> here

We already have the support for another nanopi board
in board/nanopi-neo/. Perhaps some refactoring is needed?

Also is "nanopi" really the vendor name? We normally like to have
board/<vendor>/<boardname>/.

> diff --git a/board/nanopi/post-image.sh b/board/nanopi/post-image.sh
> new file mode 100755
> index 0000000..359b4c9
> --- /dev/null
> +++ b/board/nanopi/post-image.sh
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

Could you use support/scripts/genimage.sh instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
