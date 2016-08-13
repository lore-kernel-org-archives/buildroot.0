From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Aug 2016 13:20:43 +0200
Subject: [Buildroot] [PATCH 1/2] xen: Ensure host Python2 is used
In-Reply-To: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
References: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20160813112043.GA5734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alistair, All,

On 2016-08-12 15:30 -0700, Alistair Francis spake thusly:
> To avoid Xen build issues ensure that host Python 2 is used.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Wee! Works:
    python2... /home/ymorin/dev/buildroot/O/host/usr/bin/python2
    checking for python version >= 2.3 ... yes

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xen/xen.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 759667a..e2abf25 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -8,6 +8,7 @@ XEN_VERSION = 4.6.0
>  XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
>  XEN_LICENSE = GPLv2
>  XEN_LICENSE_FILES = COPYING
> +XEN_DEPENDENCIES = host-python
>  
>  # Calculate XEN_ARCH
>  ifeq ($(ARCH),aarch64)
> @@ -17,6 +18,8 @@ XEN_ARCH = arm32
>  endif
>  
>  XEN_CONF_OPTS = --disable-ocamltools
> +
> +XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
>  XEN_MAKE_ENV = \
>  	XEN_TARGET_ARCH=$(XEN_ARCH) \
>  	CROSS_COMPILE=$(TARGET_CROSS) \
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
