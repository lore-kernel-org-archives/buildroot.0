From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:59:42 +0100
Subject: [Buildroot] [PATCH v3] libdri2: new package
In-Reply-To: <1426105822-29016-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1426105822-29016-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <20150315145942.073ed281@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerome Oufella,

On Wed, 11 Mar 2015 16:30:22 -0400, Jerome Oufella wrote:

> diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
> new file mode 100644
> index 0000000..f016e77
> --- /dev/null
> +++ b/package/libdri2/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_LIBDRI2
> +	bool "libdri2"
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XPROTO_DRI2PROTO
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +	depends on BR2_LARGEFILE # libdrm
> +	depends on BR2_PACKAGE_XORG7
> +	help
> +	  Library for the DRI2 extension to the X Window System.
> +
> +	  https://github.com/robclark/libdri2
> +
> +comment "libdri2 needs a toolchain w/ largefile, threads"
> +	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
> \ No newline at end of file

There was a missing new line here.

Other than that, I did a quick test build, and it went alright. So:
patch applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
