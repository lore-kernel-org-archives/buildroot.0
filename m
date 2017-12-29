From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 23:27:48 +0100
Subject: [Buildroot] [PATCH 2/3] package/waffle: new package
In-Reply-To: <20171225154923.18773-2-romain.naour@gmail.com>
References: <20171225154923.18773-1-romain.naour@gmail.com>
 <20171225154923.18773-2-romain.naour@gmail.com>
Message-ID: <20171229232748.28a799d3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In fact, another question.

On Mon, 25 Dec 2017 16:49:22 +0100, Romain Naour wrote:

> +config BR2_PACKAGE_WAFFLE
> +	bool "waffle"
> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL

You require libgl *or* libegl. What about OpenGL ES ?

Indeed, when you have OpenGL ES, you generally have EGL support as
well, but it seems weird that an optional dependency on OpenGL ES is
not expressed. I am missing something ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
