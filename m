From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 22 Aug 2012 09:17:13 +0200
Subject: [Buildroot] [PATCH] python: fix interpreter directive for
 python scripts
In-Reply-To: <1344663795-26449-1-git-send-email-net147@gmail.com>
References: <1344663795-26449-1-git-send-email-net147@gmail.com>
Message-ID: <50348779.5060601@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 11/08/2012 07:43, Jonathan Liu a ?crit :
> +# Fix Python interpreter directive
> +define PYTHON_FIX_INTERPRETER
> +        sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{easy_install,easy_install-2.7,idle,smtpd.py}
> +endef
> +
> +PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_FIX_INTERPRETER
> +

Could you provide a bit more input on why this patch is needed ?
Did you encounter a bug? Which one?

Thanks,
-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
