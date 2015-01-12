From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 21:42:33 +0100
Subject: [Buildroot] [PATCH v2 3/4] dtc: add host build
In-Reply-To: <1421000166-24963-3-git-send-email-ps.report@gmx.net>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
 <1421000166-24963-3-git-send-email-ps.report@gmx.net>
Message-ID: <20150112214233.3f5edf16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 11 Jan 2015 19:16:05 +0100, Peter Seiderer wrote:

> diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
> new file mode 100644
> index 0000000..cbabf0a
> --- /dev/null
> +++ b/package/dtc/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_DTC
> +	bool "host dtc"
> +	help
> +	  The Device Tree Compiler, dtc, takes as input a device-tree in
> +	  a given format and outputs a device-tree in another format.
> +
> +	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
> +
> +	  https://git.kernel.org/cgit/utils/dtc/dtc.git

I'd like to understand a bit more how this is going to be used exactly,
to see whether there is really a need for a menuconfig option for this
host package. Most host packages are merely build dependencies for
another package, and as such, don't need to appear in menuconfig.

How is host dtc going to be used in your use case?

> +# host build
> +HOST_DTC_DEPENDENCIES = host-bison host-flex

Not really needed, those dependencies are automatically inherited from
DTC_DEPENDENCIES.

> +define HOST_DTC_BUILD_CMDS
> +	$(HOST_CONFIGURE_OPTS)    \
> +	CFLAGS="$(HOST_CFLAGS)"   \

Not needed, this definition of CFLAGS is already in
$(HOST_CONFIGURE_OPTS).

Otherwise, looks good.

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
