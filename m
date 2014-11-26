From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:21:17 +0100
Subject: [Buildroot] [PATCH next] package: add python-networkmanager
In-Reply-To: <1416989784-4371-1-git-send-email-peter@korsgaard.com>
References: <1416989784-4371-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141126222117.4ff1c79d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 26 Nov 2014 09:16:24 +0100, Peter Korsgaard wrote:

> +config BR2_PACKAGE_PYTHON_NETWORKMANAGER
> +	bool "python-networkmanager"
> +	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
> +	depends on BR2_USE_WCHAR # dbus-python
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python

It is quite weird to have toolchain dependencies without the
appropriate comments, but since anyway the Python or Python 3
interpreters cannot be enabled if those dependencies are not
available... I just wonder if it's worth the hassle duplicating them
here.

But anyway, applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
