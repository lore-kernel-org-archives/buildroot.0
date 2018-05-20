From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 23:50:09 +0200
Subject: [Buildroot] [PATCH v2 1/3] uwsgi: new package
In-Reply-To: <20180202140601.21285-1-aduskett@gmail.com>
References: <20180202140601.21285-1-aduskett@gmail.com>
Message-ID: <20180520235009.27ab4388@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 09:05:59 -0500, Adam Duskett wrote:
> Uwsgi is a web server gateway interface written in python that is
> meant to be flexible and plugin oriented.
> 
> To get it to cross compile, 2 small patches had to be created:
> 
> The first fixes the build system attempting to link against /usr/lib
> instead of sysconfig.PREFIX.
> 
> The second adds a way to specify a location for xml2-config, as the
> build-system currently just blindly calls out xml2-config which
> can be on the host machine.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

A few minor nits below.

> +UWSGI_LICENSE = GPL2

This is not a valid SPDX license code.

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +    UWSGI_DEPENDENCIES += openssl

Don't indent such lines.

(This is the type of minor nits I would have fixed myself when
applying, but considering the other issues pointed out in my other
e-mail, I can't apply this patch for the moment.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
