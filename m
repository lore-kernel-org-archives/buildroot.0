From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sun, 27 Mar 2016 03:48:37 +0200
Subject: [Buildroot] [PATCH v4 3/3] dpdk: new package
In-Reply-To: <1459042284-6684-4-git-send-email-viktorin@rehivetech.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-4-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160327034837.216335ce@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Mar 2016 03:31:24 +0200
Jan Viktorin <viktorin@rehivetech.com> wrote:

> This patch introduces support of the DPDK library (www.dpdk.org) into
> Buildroot. DPDK is a library for high-speed packet sending/receiving
> while bypassing the Linux Kernel. It allows to reach a high throughput
> for 10-100 Gbps networks on the x86 platform.
> 
[...]
> +
> +# We're building a kernel module without using the kernel-module infra,
> +# so we need to tell we want module support in the kernel
> +ifeq ($(BR2_PACKAGE_DPDK),y)
> +LINUX_NEEDS_MODULES = y
> +endif

Ups, I forgot to delete this LINUX_NEEDS_MODULES (moved to Config.in
already).

Jan

> +
> +DPDK_CONFIG = $(call qstrip,$(BR2_PACKAGE_DPDK_CONFIG))
[...]
