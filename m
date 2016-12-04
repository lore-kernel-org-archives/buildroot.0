From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:24:14 +0100
Subject: [Buildroot] [PATCH v4 2/2] pru-software-support: add library
 for PRU firmware
In-Reply-To: <1480652561-8491-2-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480652561-8491-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480652561-8491-2-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161204222414.42e8c081@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Dec 2016 23:22:41 -0500, Ash Charles wrote:
> TI provides a set of headers files and libraries useful in developing
> firmware for real-time (PRU) cores embedded in some processors e.g.
> AM3358.  This package stages these files for any packages creating
> PRU firmware.
> 
> Note: As per [1], use commit v4.0.2 to sync with common TI Linux
>       versions.
> 
> [1] http://e2e.ti.com/support/arm/sitara_arm/f/791/p/552190/2018113#2018113
> 
> Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
> ---
> Changes v1 --> v2
>  * change from staging to host package (thanks Arnout & Thomas)
>  * match upstream name of pru-software-support (thanks Arnout)
>  * ensured config dependencies are propagated (thanks Arnout)
>  * added a hash file (thanks Arnout)
>  * various little clean-ups

Applied to master, with the following changes:

    [Thomas:
     - rename BR2_PACKAGE_PRU_EXAMPLES to
    BR2_PACKAGE_PRU_SOFTWARE_SUPPORT, since the package directory name
    should match the Config.in option for this package
     - use select for BR2_PACKAGE_HOST_TI_CGT_PRU, and therefore add the
       appropriate "depends on
    BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS".]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
