From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:00:36 +0200
Subject: [Buildroot] [PATCH] am33x-cm3: available only for ELF builds
In-Reply-To: <1470521075-16262-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470521075-16262-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807230036.5db357a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 00:04:35 +0200, Thomas Petazzoni wrote:
> The am33x-cm3 build system does some objcopy based binary file
> manipulation that assumes the compiler for the platform generates ELF
> file. While it's true for most ARM platforms, and especially the AM335x
> based ones, it is no longer always true since we added support for
> Cortex-M. Therefore, this package needs to depend on BR2_BINFMT_ELF.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/05f46ab28cbfc587e2e031bf38fb975447f8bab6/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/am33x-cm3/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
