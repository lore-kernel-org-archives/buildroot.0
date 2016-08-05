From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 14:01:15 +0200
Subject: [Buildroot] [PATCH] config: add Synopsys nSIM and nSIM OSCI
	platforms
In-Reply-To: <1470394586-6091-1-git-send-email-vzakhar@synopsys.com>
References: <1470394586-6091-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160805140115.071073db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 13:56:26 +0300, Vlad Zakharov wrote:
> nSIM and nSIM OSCI are 2 simulation platforms from Synopsys
> that could emulate both ARCompact and ARCv2 CPUs.
> 
> Note for ARCv2 we provide both UP (uni-processor) and SMP
> (multi-processor) configs.
> 
> So-called "standalone" nSIM and it's free flavor Free nSIM
> have only 1 peripheral - serial port. Still they are
> (especially free version) very useful for regression testing
> and debugging of Linux kernel.
> 
> nSIM OSCI emulates more functional boards having not only serial port
> but as well:
>  * LCD screen
>   * PS/2 keyboard
>    * Ethernet controller (which communicates with the host)
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Thanks for this contribution. It would be useful to add a readme.txt
file that explains how to start the result of the Buildroot build with
those simulation platforms, especially the one that is freely available.

> ---
>  configs/snps_nsim_700_defconfig          | 18 ++++++++++++++++++
>  configs/snps_nsim_hs38_defconfig         | 19 +++++++++++++++++++
>  configs/snps_nsim_hs38_smp_defconfig     | 19 +++++++++++++++++++
>  configs/snps_nsimosci_700_defconfig      | 19 +++++++++++++++++++
>  configs/snps_nsimosci_hs38_defconfig     | 20 ++++++++++++++++++++
>  configs/snps_nsimosci_hs38_smp_defconfig | 20 ++++++++++++++++++++

Do we really need all those combinations? I do understand the 700 vs.
HS38 difference, but couldn't the rest be handled with just different
DTBs ? It seems annoying to have both one kernel defconfig for each of
those, and then one Buildroot configuration for each of those as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
