From: Andreas Ziegler <br015@umbiko.net>
Date: Wed, 24 Mar 2021 06:37:23 +0000
Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
In-Reply-To: <mailman.13.1616500803.19462.buildroot@busybox.net>
References: <mailman.13.1616500803.19462.buildroot@busybox.net>
Message-ID: <75b24e8f6fe588935be2f1320d172d68@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurentiu-Cristian,

> Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w

> output/target/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi-rpi.txt

The nvram file with 'raspberrypi' in its name is not present in the 
rpi-wifi-firmware blob; you need to create it yourself. As an example, 
this is what I use in a post-build script for a RPi4:

   ### create missing nvram file for Raspberry Pi 4
   _TARGET_DIR="${TARGET_DIR}/lib/firmware"
   src_file=brcm/brcmfmac43455-sdio.txt
   dst_file=brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
   if [ -f ${_TARGET_DIR}/${src_file} ] && ! [ -h 
${_TARGET_DIR}/${dst_file} ]; then
	ln -rs ${_TARGET_DIR}/${src_file} ${_TARGET_DIR}/${dst_file}
   fi

Kind regards,
Andreas
