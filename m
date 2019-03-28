From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:56:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Allow to build
 with uclibc but w/o mausezahn
In-Reply-To: <20190304085741.13782-1-vadim4j@gmail.com>
References: <20190304085741.13782-1-vadim4j@gmail.com>
Message-ID: <20190328185612.493d0b70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Mon,  4 Mar 2019 10:57:41 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> mausezahn can't be build with uclibc because uclibc
> does not provide ceill() function, so it does not allow
> to build all netsniff-ng's tools with uclibc.
> 
> Fix it by moving mausezahn under separate config option,
> which has own dependencies and packages selection (libnet & libcli).
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Applied to master with a few changes.

> -config BR2_PACKAGE_NETSNIFF_NG
> +menuconfig BR2_PACKAGE_NETSNIFF_NG

Kept "config" here. We don't typically have a "menuconfig" for just one
sub-option.

> +NETSNIFF_NG_TOOLS = netsniff-ng trafgen astraceroute flowtop ifpps bpfc curvetun

I changed this to use the allbutmausezahn and install_allbutmausezahn targets.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
