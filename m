From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:59:12 +0100
Subject: [Buildroot] [PATCH v2 3/8] boot/arm-trusted-firmware: support
 debug mode
In-Reply-To: <1552951269-16967-3-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-3-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190320225912.65450c7f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Tue, 19 Mar 2019 00:21:04 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> When the trusted firmware is built with debug support (DEBUG defined),
> the generated images are located at a specific path. The non debug
> images are located in generated directory build/<platform>/release/
> while the debug images are located in generated directory
> build/<platform>/debug/.
> 
> This change introduces boolean BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
> to define whether the release or debug configuration is used to build
> trusted firmware. Note that enabling trusted firmware debug support, i.e
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="... DEBUG=1 ..."
> without enabling BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG will fail since
> Buildroot will get generated files from the wrong path.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

I've applied with a few minor tweaks.

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
> +	bool "Debug mode of the trusted firmware"

"of the trusted firmware" is not really useful: options are already
indented under the package they apply to, so there's no need to repeat
the package name.

> +	default n

"default n" is the default, so it's not needed.

> +	help
> +	  Enable this directive if trusted firmware is built in debug
> +	  mode.

The wording is strange: you don't want to enable this option (not
directive) if trusted firmware is built in debug mode. You want to
enable it to build ATF in debug mode.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
