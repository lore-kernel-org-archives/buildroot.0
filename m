From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 18:57:53 +0200
Subject: [Buildroot] [PATCH] qemu/sparc-ss10: update defconfig to Linux
 3.15.x
In-Reply-To: <20140728133556.GA5135@waldemar-brodkorb.de>
References: <20140728133556.GA5135@waldemar-brodkorb.de>
Message-ID: <20140728185753.4d476e26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 28 Jul 2014 15:35:56 +0200, Waldemar Brodkorb wrote:
> Update defconfig to 3.15, tested with Qemu 2.0.0.
> While updating the default config I recognized that
> networking is broken. The reason is a uClibc backport patch
> from master. Adding a fix on top of it.

The uClibc change should be separate from the defconfig update.

> diff --git a/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch b/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch
> new file mode 100644
> index 0000000..0ec1c00
> --- /dev/null
> +++ b/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch
> @@ -0,0 +1,38 @@
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +Bug introduced by uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch

What is the upstream status of this fix? Was it reported/fixed upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
