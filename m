From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 21:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] elfutils: Add a --{enable,
 disable}-backends option
In-Reply-To: <1427911925-7424-1-git-send-email-heyleke@gmail.com>
References: <1427911925-7424-1-git-send-email-heyleke@gmail.com>
Message-ID: <20150401214323.4e340217@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Heylen,

On Wed,  1 Apr 2015 20:12:05 +0200, Jan Heylen wrote:

> diff --git a/package/elfutils/0007-backends-configurable.patch b/package/elfutils/0007-backends-configurable.patch
> new file mode 100644
> index 0000000..b93e2da
> --- /dev/null
> +++ b/package/elfutils/0007-backends-configurable.patch

Patches should have a description and a Signed-off-by line.

Also, could you submit this patch upstream? I'd like to see if upstream
is willing to accept such a patch, since it is more or less a "feature"
patch, and we prefer to not have to carry such patches forever.

> +config BR2_PACKAGE_ELFUTILS_BACKENDS
> +	bool "Build and install backend shared libraries"
> +	default y
> +	help
> +	  This option tells elfutils to not only install the libelf
> +	  libraries, but also the libebl backend shared libraries
> +	  with architecture specific code to read elf files. If you
> +	  intend to use libelf/libebl at-runtime, say 'y' here.
> +	  If you only need to link against libelf at-compile-time,
> +	  but not really using it, you can leave the architecture
> +	  specific backends uninstalled. Loading of the backend library
> +	  by libebl will fail in that case.

This explanation seems weird: why would you link against libelf and not
use it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
