From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 22:17:50 +0200
Subject: [Buildroot] [PATCH v3] board: Add support for Engicam i.CoreM6
 Quad/Dual boards
In-Reply-To: <1491329412-5660-1-git-send-email-jagan@openedev.com>
References: <1491329412-5660-1-git-send-email-jagan@openedev.com>
Message-ID: <20170404221750.41125e2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 23:40:12 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Add initial support for Engicam i.CoreM6 Quad/Dual board
> with below features:
> - U-Boot 2017.01
> - Linux 4.10
> - Default packages from buildroot
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks, looking better.

> diff --git a/board/engicam/common/post-image.sh b/board/engicam/common/post-image.sh

Why do we have this 'common' folder, and this very flexible script? Do
you intend to submit the support for other boards?

This script is exactly the same as the one in
board/freescale/common/imx/post-image.sh, I definitely would like to
avoid duplication.

For now, if you're trying to submit the support for a single board, I
would suggest that you:

 1. Use a "fixed" genimage.cfg, i.e without %FILES% or %DTBS%

 2. Use support/scripts/genimage.sh

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"

Since you're using a 4.10 kernel, you also need to set:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
