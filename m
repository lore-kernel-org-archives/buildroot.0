From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 08:16:03 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump zedboard to 2014.1
In-Reply-To: <1401225332-4254-1-git-send-email-spenser@gillilanding.com>
References: <1401225332-4254-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20140528081603.0146ff8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 27 May 2014 16:15:32 -0500, Spenser Gilliland wrote:

> +Due to licensing issues, the files ps7_init.c/h are not able to be
> +distributed with the U-Boot source code.  These files are required to make a
> +boot.bin file.
> +
> +If you already have the Xilinx tools installed, the follwing sequence will
> +unpack, patch and build the rfs, kernel, uboot, and uboot-spl.
> +
> +make zedboard_defconfig
> +make uboot-patch
> +cp ${XILINX}/ISE_DS/EDK/sw/lib/hwplatform_templates/zed_hw_platform/ps7_init.{c,h} \
> +output/build/uboot-xilinx-v2014.1/boards/xilinx/zynq/
> +make

Does this means that the U-Boot build will fail without those files? If
that's the case, then that's not really an acceptable solution, because
this defconfig will continuously fail to build in our Jenkins CI.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
