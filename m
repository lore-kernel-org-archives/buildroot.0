From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Mar 2013 14:15:27 +0100
Subject: [Buildroot] [PATCH] rapidjson: new package
In-Reply-To: <1364472920-11835-1-git-send-email-spdawson@gmail.com>
References: <1364472920-11835-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130328141527.0061ef53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Thu, 28 Mar 2013 12:15:19 +0000, spdawson at gmail.com wrote:

> diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
> new file mode 100644
> index 0000000..cc260e9
> --- /dev/null
> +++ b/package/rapidjson/rapidjson.mk
> @@ -0,0 +1,34 @@
> +#############################################################
> +#
> +# rapidjson
> +#
> +#############################################################
> +
> +RAPIDJSON_VERSION = 0.11
> +RAPIDJSON_SOURCE = rapidjson-$(RAPIDJSON_VERSION).zip
> +RAPIDJSON_SITE = http://rapidjson.googlecode.com/files
> +RAPIDJSON_LICENSE = MIT
> +RAPIDJSON_LICENSE_FILES = license.txt
> +RAPIDJSON_INSTALL_TARGET = NO
> +RAPIDJSON_INSTALL_STAGING = YES

How does this thing work if you install only things in staging? Is it a
code generator that runs on the host? And if so, shouldn't some stuff
be installed in $(HOST_DIR) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
