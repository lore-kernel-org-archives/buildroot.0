From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:40:18 +0100
Subject: [Buildroot] [PATCH v2] augeas: new package
In-Reply-To: <20170311124744.22020-1-joerg.krause@embedded.rocks>
References: <20170311124744.22020-1-joerg.krause@embedded.rocks>
Message-ID: <20170321234018.76f14f4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Mar 2017 13:47:44 +0100, J?rg Krause wrote:
> Augeas is a configuration editing tool. It parses configuration files in
> their native formats and transforms them into a tree. Configuration
> changes are made by manipulating this tree and saving it back into
> native config files.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Romain Naour <romain.naour@gmail.com>

Thanks, I've applied, after fixing one minor issue.

> +	# ARC toolchain issue:
> +	# https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/108
> +	depends on !BR2_arc
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  Augeas is a configuration editing tool. It parses
> +	  configuration files in their native formats and transforms
> +	  them into a tree. Configuration changes are made by
> +	  manipulating this tree and saving it back into native config
> +	  files.
> +
> +	  http://augeas.net
> +
> +comment "augeas needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR

A "depends on !BR2_arc" was missing here, so I've added it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
