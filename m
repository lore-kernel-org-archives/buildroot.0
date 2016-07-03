From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jul 2016 21:31:13 +0200
Subject: [Buildroot] [Patch v3 1/3] ninja: new package
In-Reply-To: <1466796149-25218-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466796149-25218-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160703193113.GB3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?ric, All,

On 2016-06-24 21:22 +0200, Eric Le Bihan spake thusly:
> This new package provides the host variant of Ninja, a small build
> system with a focus on speed.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ninja/ninja.hash |  2 ++
>  package/ninja/ninja.mk   | 22 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 package/ninja/ninja.hash
>  create mode 100644 package/ninja/ninja.mk
> 
> diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
> new file mode 100644
> index 0000000..47ec822
> --- /dev/null
> +++ b/package/ninja/ninja.hash
> @@ -0,0 +1,2 @@
> +# Locally generated
> +sha256 51581de53cf4705b89eb6b14a85baa73288ad08bff256e7d30d529155813be19  ninja-v1.7.1.tar.gz
> diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
> new file mode 100644
> index 0000000..f8cada4
> --- /dev/null
> +++ b/package/ninja/ninja.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# ninja
> +#
> +################################################################################
> +
> +NINJA_VERSION = v1.7.1
> +NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
> +NINJA_LICENSE = Apache-2.0
> +NINJA_LICENSE_FILES = COPYING
> +
> +HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +
> +define HOST_NINJA_BUILD_CMDS
> +	(cd $(@D); ./configure.py --bootstrap)
> +endef
> +
> +define HOST_NINJA_INSTALL_CMDS
> +	$(INSTALL) -m 0755 $(@D)/ninja $(HOST_DIR)/usr/bin/ninja
> +endef
> +
> +$(eval $(host-generic-package))
> -- 
> 2.4.11
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
