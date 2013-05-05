From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 21:34:04 +0200
Subject: [Buildroot] [PATCH v2] IOzone: new package
In-Reply-To: <1364239565-22135-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Mon, 25 Mar 2013 12:26:05 -0700")
References: <1364239565-22135-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87vc6xnrv7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles> Changes since V1:
 Gilles> * Removed erroneous use of IA64 build target
 Gilles> * Used generic build target for uClibc-based toolchains
 Gilles> * Factorized linux-arm and linux build targets

 Gilles>  package/Config.in        |    1 +
 Gilles>  package/iozone/Config.in |   13 +++++++++++++
 Gilles>  package/iozone/iozone.mk |   38 ++++++++++++++++++++++++++++++++++++++
 Gilles>  3 files changed, 52 insertions(+), 0 deletions(-)
 Gilles>  create mode 100644 package/iozone/Config.in
 Gilles>  create mode 100644 package/iozone/iozone.mk

 Gilles> diff --git a/package/Config.in b/package/Config.in
 Gilles> index be1aa99..766b9ae 100644
 Gilles> --- a/package/Config.in
 Gilles> +++ b/package/Config.in
 Gilles> @@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 Gilles>  source "package/dhrystone/Config.in"
 Gilles>  source "package/dstat/Config.in"
 Gilles>  source "package/dmalloc/Config.in"
 Gilles> +source "package/iozone/Config.in"
 Gilles>  source "package/kexec/Config.in"
 Gilles>  source "package/latencytop/Config.in"
 Gilles>  source "package/lmbench/Config.in"
 Gilles> diff --git a/package/iozone/Config.in b/package/iozone/Config.in
 Gilles> new file mode 100644
 Gilles> index 0000000..b6dfb18
 Gilles> --- /dev/null
 Gilles> +++ b/package/iozone/Config.in
 Gilles> @@ -0,0 +1,13 @@
 Gilles> +config BR2_PACKAGE_IOZONE
 Gilles> +	bool "IOzone"

We normally use lower case for the package name.

 Gilles> +	depends on BR2_LARGEFILE
 Gilles> +	depends on BR2_USE_MMU # fork()
 Gilles> +	help
 Gilles> +	  IOzone is a filesystem benchmark tool.
 Gilles> +	  The benchmark generates and measures a variety of file operations
 Gilles> +
 Gilles> +	  http://www.iozone.org/
 Gilles> +
 Gilles> +comment "IOzone requires a toolchain with LARGEFILE support"
 Gilles> +	depends on !BR2_LARGEFILE
 Gilles> +

Extra empty line at the end.

Otherwise it looks good, committed with these minor fixes.

-- 
Bye, Peter Korsgaard
