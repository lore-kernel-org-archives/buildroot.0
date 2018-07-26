From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu, 26 Jul 2018 14:04:25 -0600
Subject: [Buildroot] [PATCH v5 1/3] uboot: zynqmp: generate SPL image
 with PMUFW binary
In-Reply-To: <20180725143538.25268-2-luca@lucaceresoli.net>
References: <20180725143538.25268-1-luca@lucaceresoli.net>
 <20180725143538.25268-2-luca@lucaceresoli.net>
Message-ID: <a734cc80-afa4-fa72-15ba-b945770a00fc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On 07/25/2018 08:35 AM, Luca Ceresoli wrote:
> In order to boot on the Xilinx ZynqMP SoCs, U-Boot SPL requires a
> recent PMU firmware loaded. Instruct U-Boot to add pmufw.bin to the
> boot.bin file together with U-Boot SPL, and the boot ROM will load
> both.
> 
> For this to work properly, a patch to U-Boot is needed. However this
> patch must be applied by each defconfig that wishes to use
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW. If it were in boot/uboot/ to be applied
> unconditionally, it would break the build for configs using a U-Boot
> version higher than 2018.7-rc1 where the patch is already applied.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Joel Carlson <joelsoncarl@gmail.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

My testing: I have my own branch off of 2018.05.1.  I removed the v4 
patches and applied these v5 patches. With minor changes to my defconfig 
to match the changes in this version, I did a clean build and verified 
my zynqmp dev board still boots.  I am using U-Boot 2018.07 which 
already contains the patch here, so I did not use the provided patch in 
my build.  The PMUFW I obtain is a local path using a $(BR2_EXTERNAL) 
variable, rather than a URI of some sort.
