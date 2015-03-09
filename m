From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 15:36:19 +0100
Subject: [Buildroot] [PATCH v2] libdri2: new package
In-Reply-To: <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1425906775-31621-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <20150309153619.0f316d11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerome Oufella,

On Mon,  9 Mar 2015 09:23:48 -0400, Jerome Oufella wrote:

> diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
> new file mode 100644
> index 0000000..d739206
> --- /dev/null
> +++ b/package/libdri2/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBDRI2
> +	bool "libdri2"
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_XORG7

We basically never "select" BR2_PACKAGE_XORG7. It should be a depends
on. Users willing to use X.org stuff are expected to understand that
they need to enable the X.org global option (BR2_PACKAGE_XORG7) to see
all X.org related features.

You also need to add a Config.in "comment" about the thread and
largefile dependencies.

> +LIBDRI2_SITE = https://github.com/robclark/libdri2.git

Can you use the 'github' macro instead?

Other than that, the rest of the patch looks good.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
