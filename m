From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 May 2013 15:48:31 +0200
Subject: [Buildroot] [PATCH 18/20] gpu-viv-bin-mx6q: new package
In-Reply-To: <878v2x7vn1.fsf@dell.be.48ers.dk>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-19-git-send-email-thomas.petazzoni@free-electrons.com>
 <878v2x7vn1.fsf@dell.be.48ers.dk>
Message-ID: <20130529154831.4ed34d89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 29 May 2013 15:39:30 +0200, Peter Korsgaard wrote:

>  Thomas> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  Thomas> +	bool "gpu-viv-bin-mx6q"
>  Thomas> +	select BR2_PACKAGE_HAS_OPENGL_EGL
>  Thomas> +	select BR2_PACKAGE_HAS_OPENGL_ES
>  Thomas> +	depends on BR2_arm # Only relevant for i.MX6
>  Thomas> +	 # Library binaries are linked against libc.so.6
>  Thomas> +	depends on BR2_TOOLCHAIN_CTNG_glibc || \
>  Thomas> +		BR2_TOOLCHAIN_CTNG_eglibc || \
>  Thomas> +		BR2_TOOLCHAIN_EXTERNAL_GLIBC
> 
> We should also inform the user about this, so I've added a comment
> option, similar to how we handle to other toolchain options.

Then we should fix BR2_PACKAGE_ELFUTILS_PROGS, BR2_PACKAGE_MONGREL2,
BR2_PACKAGE_NSS_MDNS and BR2_PACKAGE_TZDATA (even though for the
latter, I'm not sure, since tzdata is not useful at all with uClibc).

>  Thomas> +	help
>  Thomas> +	  Userspace libraries for Vivante GPU on i.MX6 platforms
>  Thomas> +
>  Thomas> +	  It contains libraries and headers for GLES, OpenCL, and
>  Thomas> +	  OpenVG.  It also contains a DRI plugin for X11. It also
>  Thomas> +	  contains a plugin for DirectFB-1.4.0, but that doesn't work
>  Thomas> +	  together with buildroot's DirectFB-1.4.16.
> 
> This is already outdated, so I changed this to 'buildroot's DirectFB
> version'.

Right.

> Committed to next, thanks - But I don't see it hooked up with the
> opengl/* virtual packages, so it doesn't seem really useful yet.

Correct. I've mainly taken Henk's patch and tried to make it suitable
for upstream. Further improvements are definitely needed.

> What kind of kernel dependencies does this package have?

As far as I can see, it doesn't have any build-time dependency. It's
just a bunch of pre-built shared libraries and header files that get
copied around. At runtime, I believe a specific kernel driver is
needed.

But Arnout/Henk can probably comment on this.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
