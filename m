From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 13:40:53 +0200
Subject: [Buildroot] [PATCH 1/1] package: add ipcalc at version 1.0.0
In-Reply-To: <20201014005921.27623-1-derrick@meter.com>
References: <20201014005921.27623-1-derrick@meter.com>
Message-ID: <20201014134053.06a0a622@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Derrick,

Thanks for your contribution! It looks mostly good, I only have a few
comments. First, the commit title we like to have for commits
introducing new packages is just:

	package/ipcalc: new package

See below for more comments.

On Wed, 14 Oct 2020 00:59:21 +0000
Derrick Lyndon Pallas <derrick@meter.com> wrote:

>  package/Config.in                           |  1 +
>  package/ipcalc/0001-disable-man-build.patch | 33 +++++++++++++++++++++
>  package/ipcalc/Config.in                    |  7 +++++
>  package/ipcalc/ipcalc.hash                  |  3 ++
>  package/ipcalc/ipcalc.mk                    | 17 +++++++++++
>  5 files changed, 61 insertions(+)

Could you add an entry in the DEVELOPERS file for this package?

> diff --git a/package/Config.in b/package/Config.in
> index 09a332e3b9..56508bbc46 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1702,6 +1702,7 @@ menu "Networking"
>  	source "package/gupnp-dlna/Config.in"
>  	source "package/ibrcommon/Config.in"
>  	source "package/ibrdtn/Config.in"
> +	source "package/ipcalc/Config.in"

It seems like you have added ipcalc under Libraries -> Networking,
which I guess isn't really appropriate as it's not a library. Perhaps
in "Networking applications" it would make more sense ?

> diff --git a/package/ipcalc/0001-disable-man-build.patch b/package/ipcalc/0001-disable-man-build.patch
> new file mode 100644
> index 0000000000..767b78162a
> --- /dev/null
> +++ b/package/ipcalc/0001-disable-man-build.patch

Could you rework this patch so that it has a proper description and
Signed-off-by line? It should also be generated using git format-patch,
and considering what it does, it should definitely be submitted
upstream.

> diff --git a/package/ipcalc/Config.in b/package/ipcalc/Config.in
> new file mode 100644
> index 0000000000..74cf84f4a4
> --- /dev/null
> +++ b/package/ipcalc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_IPCALC
> +	bool "ipcalc"

Have you tested this package using our ./utils/test-pkg utility? This
typically allows to detect if your package has dependencies on some
specific toolchain features that would need to be expressed here.

Other than those relatively small details, it looks very good. Could
you adjust the patch, and send a new iteration?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
