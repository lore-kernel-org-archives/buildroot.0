From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Jul 2021 00:00:26 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/nginx-naxsi: bump version to
 1.3
In-Reply-To: <20210630173700.30975-4-aduskett@gmail.com>
References: <20210630173700.30975-1-aduskett@gmail.com>
 <20210630173700.30975-4-aduskett@gmail.com>
Message-ID: <20210721000026.010fd8e1@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Adam,

+Yann in Cc.

On Wed, 30 Jun 2021 10:36:58 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> -NGINX_NAXSI_VERSION = 0.56
> +NGINX_NAXSI_VERSION = 1.3
>  NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
> -NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
> -NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
> +NGINX_NAXSI_LICENSE = GPL-3.0 BSD-3c

This was not quite correct: it should be comma-separated, and the SPDX
identifier for BSD-3c is BSD-3-Clause. So I changed this line to:

NGINX_NAXSI_LICENSE = GPL-3.0, BSD-3-Clause (libinjection)

> +NGINX_NAXSI_LICENSE_FILES = LICENSE naxsi_src/ext/libinjection/COPYING
> +NGINX_NAXSI_DEPENDENCIES = pcre

And also I think this new pcre dependency is not really correct. Yes,
the Config.in files selects BR2_PACKAGE_PCRE, but it doesn't mean
nginx-naxsi has a build dependency on pcre. In fact, nginx-naxsi
doesn't build anything, it only downloads code, and it's really nginx
that builds these external modules.

This was already discussed in 2016 when Samuel Martin added the
BR2_PACKAGE_PCRE select. See:

  http://lists.busybox.net/pipermail/buildroot/2016-September/172028.html
  http://lists.busybox.net/pipermail/buildroot/2016-September/172171.html

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
