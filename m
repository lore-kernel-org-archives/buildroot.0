From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Dec 2012 22:48:46 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <1354741542-6079-2-git-send-email-zinosat@tiscali.it>
References: <1354741542-6079-1-git-send-email-zinosat@tiscali.it>
 <1354741542-6079-2-git-send-email-zinosat@tiscali.it>
Message-ID: <201212052248.46769.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Davide, All,

On Wednesday 05 December 2012 Davide Viti wrote:
> 
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
>  package/Config.in        |    5 +++++
>  package/tcllib/Config.in |   12 ++++++++++++
>  package/tcllib/tcllib.mk |   23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 0 deletions(-)
>  create mode 100644 package/tcllib/Config.in
>  create mode 100644 package/tcllib/tcllib.mk
> 
> diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
> new file mode 100644
> index 0000000..2e85dc2
> --- /dev/null
> +++ b/package/tcllib/tcllib.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# tcllib
> +#
> +#############################################################
> +TCLLIB_VERSION       = 1.13
> +TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.gz
> +TCLLIB_SITE          = http://sourceforge.net/projects/tcllib/files/tcllib/$(TCLLIB_VERSION)/
> +TCLLIB_LICENSE       = BSD-2c
> +TCLLIB_LICENSE_FILES = license.terms
> +TCLLIB_DEPENDENCIES  = tcl
> +
> +define TCLLIB_INSTALL_TARGET_CMDS
> +	(cd $(@D); \
> +	    tclsh installer.tcl \

Since you're using tclsh, you may also need to depend on host-tcl.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
