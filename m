From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 14:46:23 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: fix wrong install
 step
In-Reply-To: <1467756127-30393-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1467756127-30393-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160706144623.4015111f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jul 2016 00:02:07 +0200, Angelo Compagnucci wrote:

> -PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
> +PYTHON_PILLOW_INSTALL_TARGET_CMDS = cd $(PYTHON_PILLOW_BUILDDIR); \
> +		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> +		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \

What are you doing the build_ext target again here?

> +		$(PYTHON_PILLOW_BUILD_OPTS) install \
> +		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
> +		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)

Also, please use define ... endef for those commands (ditto for the
build command, I missed that when applying the patch).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
