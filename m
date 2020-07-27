From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:43:56 +0200
Subject: [Buildroot] [PATCH] package/grpc: needs host gcc >= 4.9
In-Reply-To: <20200726210823.20922-1-yann.morin.1998@free.fr>
References: <20200726210823.20922-1-yann.morin.1998@free.fr>
Message-ID: <20200727174356.303490f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Jul 2020 23:08:23 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, because the issue manifests itself only on an ancient system, Ubuntu
> 14.04, with a now ancient gcc 4.8, we just make grpc depend on a host
> gcc >= 4.9.

According to Adam's comment, depending host gcc >= 4.9 is not the right
thing, unfortunately :-/

>  config BR2_PACKAGE_COLLECTD_GRPC
>  	bool "grpc"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # grpc

You had forgotten to update the Config.in comment with this new
dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
