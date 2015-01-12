From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 21:58:33 +0100
Subject: [Buildroot] Building for blackfin-bf609
In-Reply-To: <1421094949987.30667@nautel.com>
References: <1421094949987.30667@nautel.com>
Message-ID: <20150112215833.4e320e1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Spierenburg,

On Mon, 12 Jan 2015 20:35:50 +0000, Peter Spierenburg wrote:

> I am trying to use buildroot for a blackfin bf609 processor. My steps are as follows:

Great, one Blackfin user! We do have support for the Blackfin
architecture, but we very rarely get reports from users, so it's great
to see some interest in this!

> - Starting from buildroot-2014.11
> - make menuconfig
> - Target Architecture set to Blackfin (the default Target CPU is bf609 which is serendipitous)
> - Linux Kernel
> - Default Kernel version is 3.17.4 which is fine
> - Set Defconfig name to BF609-EZKIT
> - Exit and save
> - make
> 
> After a few minutes of furious downloading and compiling, I get:
> 
> cc1: error: -mcpu=bf609-0.0 is not valid

Hum, are you sure you did not specify BR2_GCC_TARGET_CPU_REVISION="0.0"
in your configuration? Can you send your full Buildroot .config file?

Note that Blackfin is mainly compile tested using the External toolchain
provided by ADI, which you can select in the "Toolchain" menu.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
