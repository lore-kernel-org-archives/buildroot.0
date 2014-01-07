From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 14:17:23 +0800
Subject: [Buildroot] [PATCH 1/1] python-posix-ipc: new package
In-Reply-To: <1389043097-30018-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1389043097-30018-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20140107141723.0d5b6f4c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 6 Jan 2014 15:18:17 -0600, Matt Weber wrote:

> diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
> new file mode 100644
> index 0000000..2fbc7a7
> --- /dev/null
> +++ b/package/python-posix-ipc/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_POSIX_IPC
> +	bool "python-posix-ipc"
> +	depends on BR2_PACKAGE_PYTHON

I see #include <pthread.h> in the C code of the module, so maybe this
Python module should depend on BR2_TOOLCHAIN_HAS_THREADS?

> +PYTHON_POSIX_IPC_VERSION = 0.9.6
> +PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
> +PYTHON_POSIX_IPC_SITE = http://semanchuk.com/philip/posix_ipc/
> +PYTHON_POSIX_IPC_LICENSE = BSD-2c

License is BSD-3c, not BSD-2c.

> +PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
> +PYTHON_POSIX_IPC_SETUP_TYPE = distutils

Other than that, looks good to me (but I haven't tested).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
