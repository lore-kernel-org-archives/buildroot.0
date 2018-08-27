From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:14:02 +0200
Subject: [Buildroot] [PATCH 2/3] package/mender-artifact: initial support
In-Reply-To: <20180826214146.28328-3-mirza.krak@northern.tech>
References: <20180826214146.28328-1-mirza.krak@northern.tech>
 <20180826214146.28328-3-mirza.krak@northern.tech>
Message-ID: <20180827111402.1543a8d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Aug 2018 23:41:45 +0200, Mirza Krak wrote:
> mender-artifact is a host tool to generate update images
> in the Mender artifact file format.
> 
> See https://github.com/mendersoftware/mender-artifact for more
> information about the format and the tool.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

Great to see this being packaged!

> diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
> new file mode 100644
> index 0000000000..bb03e96018
> --- /dev/null
> +++ b/package/mender-artifact/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_MENDER_ARTIFACT
> +    depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +    depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> +    depends on BR2_TOOLCHAIN_HAS_THREADS
> +    bool "host mender-artifact"
> +    help
> +      Mender image artifact tool

Please run ./utils/check-package on this new package. You will notice
that the indentation is not good, and that the "depends on" lines
should go after the "bool" line.

Please add an upstream URL in the Config.in help text (see other
packages).

> diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
> new file mode 100644
> index 0000000000..af003fe7de
> --- /dev/null
> +++ b/package/mender-artifact/mender-artifact.hash
> @@ -0,0 +1,29 @@
> +# Locally computed:
> +sha256 2a0322d8707c8ea7cada12c8f96144382264c898cadc35e8058bb9ea6bf8b041 mender-artifact-2.2.0.tar.gz
> +
> +# License, locally computed
> +

This comment feels a bit lonely, no ? Is it here to say that among the
below license hashes, the hash of "LICENSE" was locally computed, while
the hashes for the licenses in vendor/ were extracted from
LIC_FILES_CHKSUM.sha256 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
