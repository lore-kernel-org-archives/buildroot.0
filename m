From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:32:47 +0200
Subject: [Buildroot] [PATCH 4/5] package/python-mwclient: new package
In-Reply-To: <20161006044858.27768-4-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
 <20161006044858.27768-4-bernd.kuhls@t-online.de>
Message-ID: <20161007153247.35bd422a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Oct 2016 06:48:57 +0200, Bernd Kuhls wrote:

> +++ b/package/python-mwclient/python-mwclient.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-mwclient
> +#
> +################################################################################
> +
> +PYTHON_MWCLIENT_VERSION = 0.8.1
> +PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
> +PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/19/79/481b288a497f625ee8f76141ff3472d81428b1f14b7155a28a63a3247197
> +PYTHON_MWCLIENT_SETUP_TYPE = setuptools
> +PYTHON_MWCLIENT_LICENSE = MIT
> +PYTHON_MWCLIENT_DEPENDENCIES = python-requests python-six

Well, your Config.in says they are runtime dependencies, but you use
them as build-time dependencies. This doesn't look good.

Please use LICENSE.md as the license file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
