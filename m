From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:10:59 +0200
Subject: [Buildroot] [PATCH] host-gdb: Forbid simulator for ARC
In-Reply-To: <1465986501-16710-1-git-send-email-vzakhar@synopsys.com>
References: <1465986501-16710-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160615231059.14931588@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title should have been more like:

	gdb: do not allow selecting the simulator on ARC

On Wed, 15 Jun 2016 13:28:21 +0300, Vlad Zakharov wrote:
> Forbid BR2_PACKAGE_HOST_GDB_SIM selection for ARC architectures.
> Simulator isn't supported by ARC.
> 
> Fixes: http://autobuild.buildroot.net/results/4a1/4a1cd9a0beaff34830fd0f0ec47c30eda0a42d54//
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  package/gdb/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 7b319f5..004c53c 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -25,6 +25,7 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
>  
>  config BR2_PACKAGE_HOST_GDB_SIM
>  	bool "Simulator support"
> +  	depends on !BR2_arc

Indentation should be done with one tab, not with spaces.

I've applied after fixing those minor issues.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
