From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 20:04:36 +0200
Subject: [Buildroot] [PATCH 03/11] Add post-build.sh script for Arietta
 G25
In-Reply-To: <1470827167-9426-5-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-5-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160918200436.0b5baedb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 13:05:59 +0200, Biagio Montaruli wrote:

> +if [ -e ${BINARIES_DIR}/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.5.bin ]; then 
> +	if [ -e ${BINARIES_DIR}/boot.bin ]; then
> +		mkdir ${BINARIES_DIR}/arietta-at91bootstrap
> +		mv ${BINARIES_DIR}/*.bin ${BINARIES_DIR}/arietta-at91bootstrap
> +		cp -v ${BINARIES_DIR}/arietta-at91bootstrap/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin
> +	else
> +		mv ${BINARIES_DIR}/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin
> +	fi
> +else
> +	echo "Cannot find the AT91bootstrap image for Arietta-G25"
> +fi
> +

Seeing this, I believe the original logic in the genimage.cfg file was
much better:

-		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
-		};

If you really want to have the proper filename in $(BINARIES_DIR), then
do something as simple as:

mv ${BINARIES_DIR}/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin

The rest of the post-build script seems useless.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
