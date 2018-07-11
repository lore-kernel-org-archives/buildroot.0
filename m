From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 11 Jul 2018 11:59:02 +0200
Subject: [Buildroot] [PATCH v6 3/4] lld: new package
In-Reply-To: <20180710234212.4297-4-joseph.kogut@gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-4-joseph.kogut@gmail.com>
Message-ID: <274a0373-5169-350f-0eda-8c14fbc895ac@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

On 07/11/2018 01:42 AM, Joseph Kogut wrote:
> +++ b/package/lld/lld.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# lld
> +#
> +################################################################################
> +
> +LLD_VERSION = 6.0.0
> +LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
> +LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
> +LLD_LICENSE = NCSA
> +LLD_LICENSE_FILES = LICENSE.TXT
> +LLD_SUPPORTS_IN_SOURCE_BUILD = NO
> +HOST_LLD_DEPENDENCIES = host-llvm
> +
> +$(eval $(host-cmake-package))

I've just checked that lld is linking against libLLVM static libs.

I had the same problem with clang, to avoid this:

HOST_LLD_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON -DLLVM_DYLIB_COMPONENTS=all


Best regards,

Valentin
