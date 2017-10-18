From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 17:37:32 +0200
Subject: [Buildroot] [PATCH 1/1] samba4: Make python2 dependency for waf
 explicit
In-Reply-To: <20171018140304.19737-2-christian.kellermann@solectrix.de>
References: <20171018140304.19737-1-christian.kellermann@solectrix.de>
 <20171018140304.19737-2-christian.kellermann@solectrix.de>
Message-ID: <20171018173732.368ed195@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 16:03:04 +0200, Christian Kellermann wrote:
> Without this patch the build environment will pick up python3 if it is a
> dependency for other packages. Currently waf does not support
> python3.

Are we talking about host python or target python here ?

> +diff --git a/buildtools/bin/waf b/buildtools/bin/waf
> +index 1b0f4662a56..f66b992e78c 100755
> +--- a/buildtools/bin/waf
> ++++ b/buildtools/bin/waf
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python2

This runs on the host, so this is about host python, and matches your
description of "waf needs python2".

> -		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
> +		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python2-config" \

This is related to the *target* python, so how is this related to the
waf problem ?

>  		python_LDFLAGS="" \
>  		python_LIBDIR="" \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		$(SAMBA4_CONF_ENV) \
> +		PYTHON=python2 \
>  		./buildtools/bin/waf configure \
>  			--prefix=/usr \
>  			--sysconfdir=/etc \
> @@ -115,6 +116,8 @@ define SAMBA4_CONFIGURE_CMDS
>  	)
>  endef
>  
> +TARGET_MAKE_ENV += PYTHON=python2 \

Are all of these PYTHON=python2 necessary?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
