From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 21:38:33 +0100
Subject: [Buildroot] [PATCH v9 3/8] cargo-bin: new package
In-Reply-To: <20171228155146.18193-4-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-4-eric.le.bihan.dev@free.fr>
Message-ID: <20171228213833.54dc03fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 16:51:41 +0100, Eric Le Bihan wrote:
> This new package fetches a binary version of Cargo, suitable to
> bootstrap the host variants of the Rust compiler and Cargo, the package
> manager.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Looks good, just one comment below.

> diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
> new file mode 100644
> index 0000000000..e0f6381070
> --- /dev/null
> +++ b/package/cargo-bin/cargo-bin.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# cargo-bin
> +#
> +################################################################################
> +
> +CARGO_BIN_VERSION = 0.23.0
> +CARGO_BIN_SITE = https://static.rust-lang.org/dist
> +CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
> +CARGO_BIN_LICENSE = Apache-2.0 or MIT
> +CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +CARGO_BIN_STRIP_COMPONENTS = 1

This is the default, so why do you need this ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
