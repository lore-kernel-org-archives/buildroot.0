From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 22:58:11 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-web2py: remove admin
 panel
In-Reply-To: <1498637714-18933-4-git-send-email-angelo.compagnucci@gmail.com>
References: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
 <1498637714-18933-4-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170731225811.14e03884@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Jun 2017 10:15:14 +0200, Angelo Compagnucci wrote:

> -PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
> +ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN),y)
> +	PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD

FWIW, we don't indent such lines here...

> +else
> +	PYTHON_WEB2PY_EXCLUSIONS += applications/admin

... and here.

So I've fixed that up when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
