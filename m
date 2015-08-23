From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 21:02:00 +0200
Subject: [Buildroot] [PATCH] linux: enable all options needed by
 xtables-addons
In-Reply-To: <1440194309-22489-1-git-send-email-yann.morin.1998@free.fr>
References: <1440194309-22489-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150823210200.129b1843@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 21 Aug 2015 23:58:29 +0200, Yann E. MORIN wrote:
> Both of CONFIG_NF_CONNTRACK and CONFIG_NF_CONNTRACK_MARK are needed by
> xtables-addons.
> 
> Although the current code does enable them in the linux' .config file,
> the former is protected behind CONFIG_NETFILTER_ADVANCED, which may be
> missing from a user-supplied (def)config file, and is missing from some
> of the bundled defconfigs as well.
> 
> For example, the following defconfig fails to build:
> 
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_LINUX_KERNEL=y
>     BR2_LINUX_KERNEL_DEFCONFIG="i386"
>     BR2_PACKAGE_XTABLES_ADDONS=y
> 
> So, also force-enable CONFIG_NETFILTER_ADVANCED.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  linux/linux.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
