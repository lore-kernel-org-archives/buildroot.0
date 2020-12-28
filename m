From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:38:38 +0100
Subject: [Buildroot] [PATCH v4] package/rt-tests: add support to build
 without numactl
In-Reply-To: <20201227212832.GA18525@arbad>
References: <20201227212832.GA18525@arbad>
Message-ID: <20201228223838.4e4823cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Dec 2020 22:28:33 +0100
Andreas Klinger <ak@it-klinger.de> wrote:

> rt-tests don't show up in config menu and is not build if
> BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS is not available on the target
> architecture. In such a case numactl is also not available what applies for
> most small embedded targets.
> 
> This dependency was introduced with commit 7f50cbfb800e
> ("package/rt-tests: bump to version 1.8")
> 
> But rt-tests can also be build without numactl when passing NUMA=0 to make.
> This possibility is documented on
> https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rt-tests
> 
> Change Config.in and makefile to build without numactl by passing NUMA=0.
> 
> Changes in v4:
> - make numactl an optional dependency.
> 
> Changes in v3:
> - make use of numactl dependency only if BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS
>   is set.
> 
> Changes in v2:
> - Thanks to the review of Baruch patch is simplified and directly disabling
>   NUMA by querying for !BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS.
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  package/rt-tests/Config.in   | 3 ---
>  package/rt-tests/rt-tests.mk | 8 +++++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
