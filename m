From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 21:52:48 +0100
Subject: [Buildroot] [PATCH 2/2] gst1-vaapi: add optional encoder
 support.
In-Reply-To: <20170201131854.3046-2-Adamduskett@outlook.com>
References: <20170201131854.3046-1-Adamduskett@outlook.com>
 <20170201131854.3046-2-Adamduskett@outlook.com>
Message-ID: <20170312215248.02090698@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Feb 2017 08:18:54 -0500, Adam Duskett wrote:

> +if BR2_PACKAGE_GST1_VAAPI
> +
> +config BR2_PACKAGE_GST1_VAAPI_ENCODERS
> +	bool "Build encoders"

Changed to:
	
	bool "enable encoders"

> +ifneq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
> +	GST1_VAAPI_CONF_OPTS += --disable-encoders

This line should not be indented.

> +endif

Also, we normally explicitly enable and disable, so I've changed this
to:

+ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
+GST1_VAAPI_CONF_OPTS += --enable-encoders
+else
+GST1_VAAPI_CONF_OPTS += --disable-encoders
+endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
