From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:49:47 +0200
Subject: [Buildroot] [PATCH] daemon: new package
In-Reply-To: <fbdaa88f9b37850b3c15e3f0c521ef4d225a2eb9.1493701664.git.baruch@tkos.co.il>
References: <fbdaa88f9b37850b3c15e3f0c521ef4d225a2eb9.1493701664.git.baruch@tkos.co.il>
Message-ID: <20170502224947.16429ddc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 May 2017 08:07:44 +0300, Baruch Siach wrote:

> +config BR2_PACKAGE_DAEMON
> +	bool "daemon"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Daemon turns other process into daemons.
> +
> +	  http://www.libslack.org/daemon/
> +
> +comment "daemon needs a toolchain w/ threads"

depends on BR2_USE_MMU

was missing here.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Committed with this minor issue fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
