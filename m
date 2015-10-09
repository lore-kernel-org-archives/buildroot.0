From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:32:12 +0200
Subject: [Buildroot] [PATCH v2 3/4] Config.in.legacy: add missing select
 BR2_LEGACY
In-Reply-To: <1444255010-6341-3-git-send-email-ps.report@gmx.net>
References: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
 <1444255010-6341-3-git-send-email-ps.report@gmx.net>
Message-ID: <20151009153212.36448f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed,  7 Oct 2015 23:56:49 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

This patch was actually wrong: doing a "select BR2_LEGACY" on string
options is not correct. This was causing a number of warnings when
running menuconfig:

Config.in.legacy:1175:warning: config symbol 'BR2_PACKAGE_TZDATA_ZONELIST' uses select, but is not boolean or tristate
Config.in.legacy:1530:warning: config symbol 'BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL' uses select, but is not boolean or tristate
Config.in.legacy:1545:warning: config symbol 'BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION' uses select, but is not boolean or tristate
Config.in.legacy:1560:warning: config symbol 'BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL' uses select, but is not boolean or tristate
Config.in.legacy:1576:warning: config symbol 'BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION' uses select, but is not boolean or tristate

I've fixed that up in commit http://git.buildroot.net/buildroot/commit/?id=37ad0f8d7000c0be5ea47c4b968241311cc27560.

Please at least test such patches by doing a "make menuconfig" :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
