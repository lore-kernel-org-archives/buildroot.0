From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 14:44:08 +0100
Subject: [Buildroot] [PATCH V8] package/nvme: new package
In-Reply-To: <20160212105841.13451.45986.stgit@localhost.localdomain>
References: <20160212105841.13451.45986.stgit@localhost.localdomain>
Message-ID: <20160212144408.7ac40a76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mamatha Inamdar,

On Fri, 12 Feb 2016 16:58:30 +0530, Mamatha Inamdar wrote:
> Add support for building NVME utility - a utility for interacting with
> standard NVM Express (optimized PCI Express SSD interface) devices.
> 
> Changes in V8:
> /package/nvme/Makefile patch not added:
> CFLAGS changes in nvme/Makefile is not required because I did not see
> any compilation errors after adding "depend on BR2_powerpc64 || BR2_powerpc64le"
> line in nvme/Config.in for this I have to enable 64-bit arch in config file.
> after enabling 64-bit arch I do not see any compilation errors in nvme code.

I know Arnout asked you to add the PowerPC64 dependency, but I
disagree. I don't see anything in this tool that is PowerPC64 specific.

Moreover, the -m64 that was causing problem has been removed upstream,
as part of commit
https://github.com/linux-nvme/nvme-cli/commit/3686759d04825d35fb8d9667c3d4a14e880f5b4d.

In fact, I believe this commit from upstream probably solves a lot of
cross-compilation problems, so please use v0.3 instead of v0.2, since
v0.3 includes this commit.

> diff --git a/package/nvme/Config.in b/package/nvme/Config.in
> new file mode 100644
> index 0000000..878bed3
> --- /dev/null
> +++ b/package/nvme/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_NVME
> +	bool "nvme"
> +	depends on BR2_powerpc64 || BR2_powerpc64le

Remove this dependency.

> +

And this empty line/

> +	help
> +	  Add support for building NVME utility - a utility

"Add support" is not a proper wording to describe a package. Instead,
you should just have something like:

	  NVME utility, a utility for interacting with standard NVM
	  Express ...

> +	  for interacting with standard NVM Express
> +	  (optimized PCI Express SSD interface) devices.
> +
> +	  https://github.com/linux-nvme/nvme-cli

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
