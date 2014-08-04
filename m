From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:33:52 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-userland: Fix vcfiled startup
In-Reply-To: <1407176456-13473-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176456-13473-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140804203352.310380a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon,  4 Aug 2014 20:20:56 +0200, Beno?t Th?baudeau wrote:
> The VideoCore file server daemon SysV startup script installed from this package
> is not compatible with BuildRoot (because of its naming and other Debian
> dependencies), which prevented vcfiled from starting. Hence, prevent this
> package from installing its vcfiled startup script, and install a vcfiled SysV
> startup script suitable for BuildRoot.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

Thanks for this patch. Experts in rpi stuff will comment, but I have
one question below:


> diff --git a/package/rpi-userland/S97vcfiled b/package/rpi-userland/S97vcfiled
> new file mode 100755
> index 0000000..87c4e76
> --- /dev/null
> +++ b/package/rpi-userland/S97vcfiled
> @@ -0,0 +1,100 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides:          vcfiled
> +# Required-Start:    udev
> +# Required-Stop:     udev
> +# Short-Description: VideoCore file server daemon
> +### END INIT INFO

I don't think we need this header in Buildroot, since neither the
Busybox init nor the sysvinit are making any use of it.

However, it indicates a dependency on udev, while the rpi-userland
package certainly does not depend on udev.

Also, this daemon was until not running on any rpi configuration
according to what you said. So what it is useful for? Should it be
mandatory for all rpi-userland installations, or optional?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
