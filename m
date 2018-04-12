From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 13:30:06 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: new package
In-Reply-To: <1523526148-9678-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523526148-9678-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180412133006.2af0467b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version. However, you forgot to take into account
some comments from the previous version, including a major one.

On Thu, 12 Apr 2018 11:42:28 +0200, Guillaume W. Bres wrote:

> diff --git a/package/pixiewps/Config.in b/package/pixiewps/Config.in
> new file mode 100644
> index 0000000..013e7f6
> --- /dev/null
> +++ b/package/pixiewps/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PIXIEWPS
> +	bool "pixiewps"
> +

Unneeded empty line.


> +PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
> +PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
> +PIXIEWPS_LICENSE = GPL-2.0+
> +PIXIEWPS_LICENSE_FILES = LICENSE.md
> +
> +PIXIEWPS_SUBDIR = src
> +
> +$(eval $(generic-package))

The most important comment: this package doesn't do anything. A
generic-package without any BUILD_CMDS and INSTALL_TARGET_CMDS will not
do anything besides downloading the source code and extracting it.

How did you test this ? I don't see how it can produce anything useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
