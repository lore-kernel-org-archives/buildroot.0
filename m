From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 04 Apr 2012 20:09:07 +0200
Subject: [Buildroot] [PATCH 2/2] qemu/microblazebe-mmu: add new sample
 config
In-Reply-To: <1332193479-7415-3-git-send-email-gustavo@zacarias.com.ar>
References: <1332193479-7415-1-git-send-email-gustavo@zacarias.com.ar>
 <1332193479-7415-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <4F7C8E43.402@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.03.2012 22:44, schrieb Gustavo Zacarias:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Stephan Hoffmann <sho@reLinux.de>
Works with Qemu 1.0.1 default configuration on Ubuntu 10.04
> ---
>  board/qemu/microblazebe-mmu/kernel-3.3.config |   68 +++++
>  board/qemu/microblazebe-mmu/readme.txt        |    6 +
>  board/qemu/microblazebe-mmu/system.dts        |  367 +++++++++++++++++++++++++
>  configs/qemu_microblazebe_mmu_defconfig       |   16 +
>  4 files changed, 457 insertions(+), 0 deletions(-)
>  create mode 100644 board/qemu/microblazebe-mmu/kernel-3.3.config
>  create mode 100644 board/qemu/microblazebe-mmu/readme.txt
>  create mode 100644 board/qemu/microblazebe-mmu/system.dts
>  create mode 100644 configs/qemu_microblazebe_mmu_defconfig
>
> diff --git a/board/qemu/microblazebe-mmu/kernel-3.3.config b/board/qemu/microblazebe-mmu/kernel-3.3.config
> new file mode 100644
> index 0000000..7083cf5
> --- /dev/null
> +++ b/board/qemu/microblazebe-mmu/kernel-3.3.config
> @@ -0,0 +1,68 @@
> +CONFIG_EXPERIMENTAL=y
> +CONFIG_SYSVIPC=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_SYSFS_DEPRECATED_V2=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
> +CONFIG_INITRAMFS_COMPRESSION_GZIP=y
> +# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> +CONFIG_EXPERT=y
> +CONFIG_KALLSYMS_ALL=y
> +CONFIG_KALLSYMS_EXTRA_PASS=y
> +# CONFIG_HOTPLUG is not set
> +# CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
> +# CONFIG_EPOLL is not set
> +# CONFIG_SIGNALFD is not set
> +# CONFIG_SHMEM is not set
> +CONFIG_SLAB=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_OPT_LIB_ASM=y
> +CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
> +CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
> +CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
> +CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
> +CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
> +CONFIG_HZ_100=y
> +CONFIG_MMU=y
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_FORCE=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +# CONFIG_INET_LRO is not set
> +# CONFIG_IPV6 is not set
> +CONFIG_PROC_DEVICETREE=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_SIZE=8192
> +CONFIG_NETDEVICES=y
> +CONFIG_NET_ETHERNET=y
> +CONFIG_XILINX_EMACLITE=y
> +# CONFIG_INPUT is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +CONFIG_SERIAL_UARTLITE=y
> +CONFIG_SERIAL_UARTLITE_CONSOLE=y
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_HWMON is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_EXT2_FS=y
> +# CONFIG_DNOTIFY is not set
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3=y
> +CONFIG_CIFS=y
> +CONFIG_CIFS_STATS=y
> +CONFIG_CIFS_STATS2=y
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEBUG_SLAB=y
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_INFO=y
> +# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> +CONFIG_EARLY_PRINTK=y
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
> new file mode 100644
> index 0000000..c59c0bd
> --- /dev/null
> +++ b/board/qemu/microblazebe-mmu/readme.txt
> @@ -0,0 +1,6 @@
> +Run the emulation with:
> +
> + qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
> +
> +The login prompt will appear in the terminal that started Qemu.
> +
> diff --git a/board/qemu/microblazebe-mmu/system.dts b/board/qemu/microblazebe-mmu/system.dts
> new file mode 100644
> index 0000000..3f85df2
> --- /dev/null
> +++ b/board/qemu/microblazebe-mmu/system.dts
> @@ -0,0 +1,367 @@
> +/*
> + * Device Tree Generator version: 1.1
> + *
> + * (C) Copyright 2007-2008 Xilinx, Inc.
> + * (C) Copyright 2007-2009 Michal Simek
> + *
> + * Michal SIMEK <monstr@monstr.eu>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> + * MA 02111-1307 USA
> + *
> + * CAUTION: This file is automatically generated by libgen.
> + * Version: Xilinx EDK 10.1.03 EDK_K_SP3.6
> + *
> + * XPS project directory: Xilinx-ML505-ll_temac-sgdma-MMU-FDT-edk101
> + */
> +
> +/dts-v1/;
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "xlnx,microblaze";
> +	hard-reset-gpios = <&LEDs_8Bit 2 1>;
> +	model = "testing";
> +	DDR2_SDRAM: memory at 90000000 {
> +		device_type = "memory";
> +		reg = < 0x90000000 0x10000000 >;
> +	} ;
> +	aliases {
> +		ethernet0 = &Hard_Ethernet_MAC;
> +		serial0 = &RS232_Uart_1;
> +	} ;
> +	chosen {
> +		bootargs = "console=ttyUL0,115200 highres=on";
> +		linux,stdout-path = "/plb at 0/serial at 84000000";
> +	} ;
> +	cpus {
> +		#address-cells = <1>;
> +		#cpus = <0x1>;
> +		#size-cells = <0>;
> +		microblaze_0: cpu at 0 {
> +			clock-frequency = <125000000>;
> +			compatible = "xlnx,microblaze-7.10.d";
> +			d-cache-baseaddr = <0x90000000>;
> +			d-cache-highaddr = <0x9fffffff>;
> +			d-cache-line-size = <0x10>;
> +			d-cache-size = <0x2000>;
> +			device_type = "cpu";
> +			i-cache-baseaddr = <0x90000000>;
> +			i-cache-highaddr = <0x9fffffff>;
> +			i-cache-line-size = <0x10>;
> +			i-cache-size = <0x2000>;
> +			model = "microblaze,7.10.d";
> +			reg = <0>;
> +			timebase-frequency = <125000000>;
> +			xlnx,addr-tag-bits = <0xf>;
> +			xlnx,allow-dcache-wr = <0x1>;
> +			xlnx,allow-icache-wr = <0x1>;
> +			xlnx,area-optimized = <0x0>;
> +			xlnx,cache-byte-size = <0x2000>;
> +			xlnx,d-lmb = <0x1>;
> +			xlnx,d-opb = <0x0>;
> +			xlnx,d-plb = <0x1>;
> +			xlnx,data-size = <0x20>;
> +			xlnx,dcache-addr-tag = <0xf>;
> +			xlnx,dcache-always-used = <0x1>;
> +			xlnx,dcache-byte-size = <0x2000>;
> +			xlnx,dcache-line-len = <0x4>;
> +			xlnx,dcache-use-fsl = <0x1>;
> +			xlnx,debug-enabled = <0x1>;
> +			xlnx,div-zero-exception = <0x1>;
> +			xlnx,dopb-bus-exception = <0x0>;
> +			xlnx,dynamic-bus-sizing = <0x1>;
> +			xlnx,edge-is-positive = <0x1>;
> +			xlnx,family = "virtex5";
> +			xlnx,endianness = <0x1>;
> +			xlnx,fpu-exception = <0x1>;
> +			xlnx,fsl-data-size = <0x20>;
> +			xlnx,fsl-exception = <0x0>;
> +			xlnx,fsl-links = <0x0>;
> +			xlnx,i-lmb = <0x1>;
> +			xlnx,i-opb = <0x0>;
> +			xlnx,i-plb = <0x1>;
> +			xlnx,icache-always-used = <0x1>;
> +			xlnx,icache-line-len = <0x4>;
> +			xlnx,icache-use-fsl = <0x1>;
> +			xlnx,ill-opcode-exception = <0x1>;
> +			xlnx,instance = "microblaze_0";
> +			xlnx,interconnect = <0x1>;
> +			xlnx,interrupt-is-edge = <0x0>;
> +			xlnx,iopb-bus-exception = <0x0>;
> +			xlnx,mmu-dtlb-size = <0x4>;
> +			xlnx,mmu-itlb-size = <0x2>;
> +			xlnx,mmu-tlb-access = <0x3>;
> +			xlnx,mmu-zones = <0x10>;
> +			xlnx,number-of-pc-brk = <0x1>;
> +			xlnx,number-of-rd-addr-brk = <0x0>;
> +			xlnx,number-of-wr-addr-brk = <0x0>;
> +			xlnx,opcode-0x0-illegal = <0x1>;
> +			xlnx,pvr = <0x2>;
> +			xlnx,pvr-user1 = <0x0>;
> +			xlnx,pvr-user2 = <0x0>;
> +			xlnx,reset-msr = <0x0>;
> +			xlnx,sco = <0x0>;
> +			xlnx,unaligned-exceptions = <0x1>;
> +			xlnx,use-barrel = <0x1>;
> +			xlnx,use-dcache = <0x1>;
> +			xlnx,use-div = <0x1>;
> +			xlnx,use-ext-brk = <0x1>;
> +			xlnx,use-ext-nm-brk = <0x1>;
> +			xlnx,use-extended-fsl-instr = <0x0>;
> +			xlnx,use-fpu = <0x2>;
> +			xlnx,use-hw-mul = <0x2>;
> +			xlnx,use-icache = <0x1>;
> +			xlnx,use-interrupt = <0x1>;
> +			xlnx,use-mmu = <0x3>;
> +			xlnx,use-msr-instr = <0x1>;
> +			xlnx,use-pcmp-instr = <0x1>;
> +		} ;
> +	} ;
> +	mb_plb: plb at 0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "xlnx,plb-v46-1.03.a", "xlnx,plb-v46-1.00.a", "simple-bus";
> +		ranges ;
> +		FLASH: flash at a0000000 {
> +			bank-width = <2>;
> +			compatible = "xlnx,xps-mch-emc-2.00.a", "cfi-flash";
> +			reg = < 0xa0000000 0x2000000 >;
> +			xlnx,family = "virtex5";
> +			xlnx,include-datawidth-matching-0 = <0x1>;
> +			xlnx,include-datawidth-matching-1 = <0x0>;
> +			xlnx,include-datawidth-matching-2 = <0x0>;
> +			xlnx,include-datawidth-matching-3 = <0x0>;
> +			xlnx,include-negedge-ioregs = <0x0>;
> +			xlnx,include-plb-ipif = <0x1>;
> +			xlnx,include-wrbuf = <0x1>;
> +			xlnx,max-mem-width = <0x10>;
> +			xlnx,mch-native-dwidth = <0x20>;
> +			xlnx,mch-plb-clk-period-ps = <0x1f40>;
> +			xlnx,mch-splb-awidth = <0x20>;
> +			xlnx,mch0-accessbuf-depth = <0x10>;
> +			xlnx,mch0-protocol = <0x0>;
> +			xlnx,mch0-rddatabuf-depth = <0x10>;
> +			xlnx,mch1-accessbuf-depth = <0x10>;
> +			xlnx,mch1-protocol = <0x0>;
> +			xlnx,mch1-rddatabuf-depth = <0x10>;
> +			xlnx,mch2-accessbuf-depth = <0x10>;
> +			xlnx,mch2-protocol = <0x0>;
> +			xlnx,mch2-rddatabuf-depth = <0x10>;
> +			xlnx,mch3-accessbuf-depth = <0x10>;
> +			xlnx,mch3-protocol = <0x0>;
> +			xlnx,mch3-rddatabuf-depth = <0x10>;
> +			xlnx,mem0-width = <0x10>;
> +			xlnx,mem1-width = <0x20>;
> +			xlnx,mem2-width = <0x20>;
> +			xlnx,mem3-width = <0x20>;
> +			xlnx,num-banks-mem = <0x1>;
> +			xlnx,num-channels = <0x0>;
> +			xlnx,priority-mode = <0x0>;
> +			xlnx,synch-mem-0 = <0x0>;
> +			xlnx,synch-mem-1 = <0x0>;
> +			xlnx,synch-mem-2 = <0x0>;
> +			xlnx,synch-mem-3 = <0x0>;
> +			xlnx,synch-pipedelay-0 = <0x2>;
> +			xlnx,synch-pipedelay-1 = <0x2>;
> +			xlnx,synch-pipedelay-2 = <0x2>;
> +			xlnx,synch-pipedelay-3 = <0x2>;
> +			xlnx,tavdv-ps-mem-0 = <0x1adb0>;
> +			xlnx,tavdv-ps-mem-1 = <0x3a98>;
> +			xlnx,tavdv-ps-mem-2 = <0x3a98>;
> +			xlnx,tavdv-ps-mem-3 = <0x3a98>;
> +			xlnx,tcedv-ps-mem-0 = <0x1adb0>;
> +			xlnx,tcedv-ps-mem-1 = <0x3a98>;
> +			xlnx,tcedv-ps-mem-2 = <0x3a98>;
> +			xlnx,tcedv-ps-mem-3 = <0x3a98>;
> +			xlnx,thzce-ps-mem-0 = <0x88b8>;
> +			xlnx,thzce-ps-mem-1 = <0x1b58>;
> +			xlnx,thzce-ps-mem-2 = <0x1b58>;
> +			xlnx,thzce-ps-mem-3 = <0x1b58>;
> +			xlnx,thzoe-ps-mem-0 = <0x1b58>;
> +			xlnx,thzoe-ps-mem-1 = <0x1b58>;
> +			xlnx,thzoe-ps-mem-2 = <0x1b58>;
> +			xlnx,thzoe-ps-mem-3 = <0x1b58>;
> +			xlnx,tlzwe-ps-mem-0 = <0x88b8>;
> +			xlnx,tlzwe-ps-mem-1 = <0x0>;
> +			xlnx,tlzwe-ps-mem-2 = <0x0>;
> +			xlnx,tlzwe-ps-mem-3 = <0x0>;
> +			xlnx,twc-ps-mem-0 = <0x2af8>;
> +			xlnx,twc-ps-mem-1 = <0x3a98>;
> +			xlnx,twc-ps-mem-2 = <0x3a98>;
> +			xlnx,twc-ps-mem-3 = <0x3a98>;
> +			xlnx,twp-ps-mem-0 = <0x11170>;
> +			xlnx,twp-ps-mem-1 = <0x2ee0>;
> +			xlnx,twp-ps-mem-2 = <0x2ee0>;
> +			xlnx,twp-ps-mem-3 = <0x2ee0>;
> +			xlnx,xcl0-linesize = <0x4>;
> +			xlnx,xcl0-writexfer = <0x1>;
> +			xlnx,xcl1-linesize = <0x4>;
> +			xlnx,xcl1-writexfer = <0x1>;
> +			xlnx,xcl2-linesize = <0x4>;
> +			xlnx,xcl2-writexfer = <0x1>;
> +			xlnx,xcl3-linesize = <0x4>;
> +			xlnx,xcl3-writexfer = <0x1>;
> +		} ;
> +		Hard_Ethernet_MAC: xps-ll-temac at 81c00000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "xlnx,compound";
> +			ranges ;
> +			ethernet at 81c00000 {
> +				compatible = "xlnx,xps-ll-temac-1.01.b", "xlnx,xps-ll-temac-1.00.a";
> +				device_type = "network";
> +				interrupt-parent = <&xps_intc_0>;
> +				interrupts = < 5 2 >;
> +				llink-connected = <&PIM3>;
> +				local-mac-address = [ 00 0a 35 00 00 00 ];
> +				reg = < 0x81c00000 0x40 >;
> +				xlnx,bus2core-clk-ratio = <0x1>;
> +				xlnx,phy-type = <0x1>;
> +				xlnx,phyaddr = <0x1>;
> +				xlnx,rxcsum = <0x0>;
> +				xlnx,rxfifo = <0x1000>;
> +				xlnx,temac-type = <0x0>;
> +				xlnx,txcsum = <0x0>;
> +				xlnx,txfifo = <0x1000>;
> +			} ;
> +		} ;
> +		IIC_EEPROM: i2c at 81600000 {
> +			compatible = "xlnx,xps-iic-2.00.a";
> +			interrupt-parent = <&xps_intc_0>;
> +			interrupts = < 6 2 >;
> +			reg = < 0x81600000 0x10000 >;
> +			xlnx,clk-freq = <0x7735940>;
> +			xlnx,family = "virtex5";
> +			xlnx,gpo-width = <0x1>;
> +			xlnx,iic-freq = <0x186a0>;
> +			xlnx,scl-inertial-delay = <0x0>;
> +			xlnx,sda-inertial-delay = <0x0>;
> +			xlnx,ten-bit-adr = <0x0>;
> +		} ;
> +		LEDs_8Bit: gpio at 81400000 {
> +			compatible = "xlnx,xps-gpio-1.00.a";
> +			interrupt-parent = <&xps_intc_0>;
> +			interrupts = < 7 2 >;
> +			reg = < 0x81400000 0x10000 >;
> +			xlnx,all-inputs = <0x0>;
> +			xlnx,all-inputs-2 = <0x0>;
> +			xlnx,dout-default = <0x0>;
> +			xlnx,dout-default-2 = <0x0>;
> +			xlnx,family = "virtex5";
> +			xlnx,gpio-width = <0x8>;
> +			xlnx,interrupt-present = <0x1>;
> +			xlnx,is-bidir = <0x1>;
> +			xlnx,is-bidir-2 = <0x1>;
> +			xlnx,is-dual = <0x0>;
> +			xlnx,tri-default = <0xffffffff>;
> +			xlnx,tri-default-2 = <0xffffffff>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +		} ;
> +
> +		gpio-leds {
> +			compatible = "gpio-leds";
> +
> +			heartbeat {
> +				label = "Heartbeat";
> +				gpios = <&LEDs_8Bit 4 1>;
> +				linux,default-trigger = "heartbeat";
> +			};
> +
> +			yellow {
> +				label = "Yellow";
> +				gpios = <&LEDs_8Bit 5 1>;
> +			};
> +
> +			red {
> +				label = "Red";
> +				gpios = <&LEDs_8Bit 6 1>;
> +			};
> +
> +			green {
> +				label = "Green";
> +				gpios = <&LEDs_8Bit 7 1>;
> +			};
> +		} ;
> +		RS232_Uart_1: serial at 84000000 {
> +			clock-frequency = <125000000>;
> +			compatible = "xlnx,xps-uartlite-1.00.a";
> +			current-speed = <115200>;
> +			device_type = "serial";
> +			interrupt-parent = <&xps_intc_0>;
> +			interrupts = < 8 0 >;
> +			port-number = <0>;
> +			reg = < 0x84000000 0x10000 >;
> +			xlnx,baudrate = <0x1c200>;
> +			xlnx,data-bits = <0x8>;
> +			xlnx,family = "virtex5";
> +			xlnx,odd-parity = <0x0>;
> +			xlnx,use-parity = <0x0>;
> +		} ;
> +		SysACE_CompactFlash: sysace at 83600000 {
> +			compatible = "xlnx,xps-sysace-1.00.a";
> +			interrupt-parent = <&xps_intc_0>;
> +			interrupts = < 4 2 >;
> +			reg = < 0x83600000 0x10000 >;
> +			xlnx,family = "virtex5";
> +			xlnx,mem-width = <0x10>;
> +		} ;
> +		debug_module: debug at 84400000 {
> +			compatible = "xlnx,mdm-1.00.d";
> +			reg = < 0x84400000 0x10000 >;
> +			xlnx,family = "virtex5";
> +			xlnx,interconnect = <0x1>;
> +			xlnx,jtag-chain = <0x2>;
> +			xlnx,mb-dbg-ports = <0x1>;
> +			xlnx,uart-width = <0x8>;
> +			xlnx,use-uart = <0x1>;
> +			xlnx,write-fsl-ports = <0x0>;
> +		} ;
> +		mpmc at 90000000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "xlnx,mpmc-4.02.a";
> +			ranges ;
> +			PIM3: sdma at 84600180 {
> +				compatible = "xlnx,ll-dma-1.00.a";
> +				interrupt-parent = <&xps_intc_0>;
> +				interrupts = < 2 2 1 2 >;
> +				reg = < 0x84600180 0x80 >;
> +			} ;
> +		} ;
> +		xps_intc_0: interrupt-controller at 81800000 {
> +			#interrupt-cells = <0x2>;
> +			compatible = "xlnx,xps-intc-1.00.a";
> +			interrupt-controller ;
> +			reg = < 0x81800000 0x10000 >;
> +			xlnx,kind-of-intr = <0x100>;
> +			xlnx,num-intr-inputs = <0x9>;
> +		} ;
> +		xps_timer_1: timer at 83c00000 {
> +			compatible = "xlnx,xps-timer-1.00.a";
> +			interrupt-parent = <&xps_intc_0>;
> +			interrupts = < 3 2 >;
> +			reg = < 0x83c00000 0x10000 >;
> +			xlnx,count-width = <0x20>;
> +			xlnx,family = "virtex5";
> +			xlnx,gen0-assert = <0x1>;
> +			xlnx,gen1-assert = <0x1>;
> +			xlnx,one-timer-only = <0x0>;
> +			xlnx,trig0-assert = <0x1>;
> +			xlnx,trig1-assert = <0x1>;
> +		} ;
> +	} ;
> +}  ;
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> new file mode 100644
> index 0000000..378e972
> --- /dev/null
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -0,0 +1,16 @@
> +BR2_microblaze=y
> +BR2_microblazebe=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.3.config"
> +BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazebe-mmu/system.dts"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="linux.bin"


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
