From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 May 2020 16:10:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/qemu: bump to 5.0.0
In-Reply-To: <20200502135205.1084120-2-romain.naour@gmail.com>
References: <20200502135205.1084120-1-romain.naour@gmail.com>
 <20200502135205.1084120-2-romain.naour@gmail.com>
Message-ID: <20200502161031.4d93faf2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 May 2020 15:52:05 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> +# virtfs-proxy-helper is the only user of libcap-ng.
>  ifeq ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
> -HOST_QEMU_OPTS += --enable-virtfs
> -HOST_QEMU_DEPENDENCIES += host-libcap
> +HOST_QEMU_OPTS += --enable-virtfs --enable-cap-ng
> +HOST_QEMU_DEPENDENCIES += host-libcap-ng

We don't have any host-libcap-ng package, we only have the target
variant for libcap-ng, so I don't think this can build.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
