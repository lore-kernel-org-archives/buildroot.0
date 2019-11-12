From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 21:53:41 +0100
Subject: [Buildroot] [PATCH,
 next 1/1] package/libglib2: bump to version 2.62.2
In-Reply-To: <20191111210251.2216431-1-aduskett@gmail.com>
References: <20191111210251.2216431-1-aduskett@gmail.com>
Message-ID: <20191112215341.28f7b1aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 11 Nov 2019 13:02:51 -0800
aduskett at gmail.com wrote:

> diff --git a/package/libglib2/0002-add-option-to-build-tests.patch b/package/libglib2/0002-add-option-to-build-tests.patch
> index 5caaaff6b2..5f0d638dbf 100644
> --- a/package/libglib2/0002-add-option-to-build-tests.patch
> +++ b/package/libglib2/0002-add-option-to-build-tests.patch

This patch is no longer adding an option to build tests, so I'm
surprised that the title/commit description hasn't changed.

> + # Don?t build the tests unless we can run them (either natively, in an exe wrapper, or by installing them for later use)
> +-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper()) or installed_tests_enabled
> ++build_tests = installed_tests_enabled

Why do we need to change this ? Is meson.has_exe_wrapper() true in our case ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
