From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 00:06:59 +0200
Subject: [Buildroot] [PATCH] python-ws4py: new package
In-Reply-To: <1423428968-10953-1-git-send-email-yegorslists@googlemail.com>
References: <1423428968-10953-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150401000659.7d177e27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sun,  8 Feb 2015 21:56:08 +0100, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-ws4py/Config.in         |  7 +++++++
>  package/python-ws4py/python-ws4py.hash |  3 +++
>  package/python-ws4py/python-ws4py.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-ws4py/Config.in
>  create mode 100644 package/python-ws4py/python-ws4py.hash
>  create mode 100644 package/python-ws4py/python-ws4py.mk

I've applied your patch, after making one fix to it:

> +PYTHON_WS4PY_LICENSE = BSD-3c
> +PYTHON_WS4PY_LICENSE_FILES = LICENSE

There is no file named 'LICENSE' in the tarball. Please try to check by
running 'make legal-info' that the <pkg>_LICENSE_FILES variable is
correct. I replaced it by ws4py/__init__.py, since it's the only file
that carries copyright/license information;

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
