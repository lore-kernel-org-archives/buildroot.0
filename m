From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:30:02 +0100
Subject: [Buildroot] [PATCH] package/erofs-utils: bump version to 1.2
In-Reply-To: <20201217093356.24403-1-hsiangkao@aol.com>
References: <20201217093356.24403-1-hsiangkao.ref@aol.com>
 <20201217093356.24403-1-hsiangkao@aol.com>
Message-ID: <20201229233002.0ca0d772@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Dec 2020 17:33:56 +0800
Gao Xiang via buildroot <buildroot@busybox.net> wrote:

> - add selinux support;
> - add erofsfuse support;
> - add 0001-erofs-utils-fix-multiple-definition-of-sbi.patch [1];
> - add 0002-erofs-utils-fuse-fix-linking-when-using-with-selinux.patch [2];
> - add 0003-erofs-utils-fuse-disable-backtrace-if-unsupported.patch.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=6c938b755682629a26f85e5540f40c0d316130ed
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=f1f9659e98ea925a100e50332309955f5b2b4234
> 
> Signed-off-by: Gao Xiang <hsiangkao@aol.com>

Thanks, I've applied, with one small change, see below.

> +config BR2_PACKAGE_EROFS_UTILS_EROFSFUSE
> +	bool "erofsfuse support"
> +	depends on !BR2_STATIC_LIBS # libfuse
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse

You forgot to replicate the BR2_USE_MMU dependency of
BR2_PACKAGE_LIBFUSE here, so I did that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
