From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:39:50 +0200
Subject: [Buildroot] [PATCH 2/4] package/gumbo-parser: new package
In-Reply-To: <20210630234717.21742-2-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
 <20210630234717.21742-2-raphael.melotte@mind.be>
Message-ID: <20210720233950.29752fd1@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Thu,  1 Jul 2021 01:47:14 +0200
Rapha?l M?lotte <raphael.melotte@mind.be> wrote:

> Gumbo is an implementation of the HTML5 parsing algorithm implemented
> as a pure C99 library with no outside dependencies.
> 
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>

I've applied, with one important change, see below.

> +GUMBO_PARSER_VERSION = 0.10.1
> +GUMBO_PARSER_SITE = $(call github,google,gumbo-parser,v$(GUMBO_PARSER_VERSION))
> +GUMBO_PARSER_LICENSE = Apache-2.0
> +GUMBO_PARSER_LICENSE_FILES = COPYING
> +GUMBO_PARSER_INSTALL_STAGING = YES
> +
> +define GUMBO_PARSER_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +GUMBO_PARSER_PRE_CONFIGURE_HOOKS += GUMBO_PARSER_RUN_AUTOGEN

This is not good, as it doesn't add autoconf/automake to the
dependencies of the package. So I've replaced with:

GUMBO_PARSER_AUTORECONF = YES

which does work.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
