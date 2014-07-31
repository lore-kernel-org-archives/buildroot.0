From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 22:53:37 +0200
Subject: [Buildroot] [PATCH 2/2] libevdev: remove host python dependency
In-Reply-To: <1406839593-32462-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406839593-32462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1406839593-32462-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140731205336.GI3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-31 22:46 +0200, Thomas Petazzoni spake thusly:
> In commit 79c31e3297da7f0aec4d4675c154736e4cffe3ed ("package/libevdev:
> add dependency on host-python"), Yann added a dependency of libevdev
> on host-python, because the Python script in evdev was using argparse
> which is only available since Python 2.6. At the time, this was
> causing failures on machines that were using Python versions older
> than 2.6.
> 
> However, since Yann's patch, the libevdev version has been bumped. And
> one of the upstream commit,
> http://cgit.freedesktop.org/libevdev/commit/libevdev/?id=cea8f0b8cc86332b0643acd62f24f9fef2ecc153,
> was precisely made to remove the argparse dependency to avoid the
> need to have a >= 2.6 Python version.
> 
> Thanks to this, we can avoid the host-python dependency and rely on
> the system-installed Python version instead.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libevdev/libevdev.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
> index 738af92..a9a1d41 100644
> --- a/package/libevdev/libevdev.mk
> +++ b/package/libevdev/libevdev.mk
> @@ -12,13 +12,6 @@ LIBEVDEV_LICENSE_FILES = COPYING
>  # Uses PKG_CHECK_MODULES() in configure.ac
>  LIBEVDEV_DEPENDENCIES = host-pkgconf
>  
> -# Needs Python to generate a header file
> -# We can't rely on the system Python, since it may be too old
> -# (missing argparse in python 2.6)
> -# libevdev build scripts support both python2 and python3, so avoid unneeded
> -# dependency on host-python.
> -LIBEVDEV_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> -
>  # package source code coming from git, so it doesn't have generated
>  # configure and Makefile.in
>  LIBEVDEV_AUTORECONF = YES
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
