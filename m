From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Dec 2013 12:55:37 +0100
Subject: [Buildroot] [PATCH] ti-uim: Add new package
In-Reply-To: <1386502217-2761-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1386502217-2761-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20131208115537.GA3363@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre, All,

On 2013-12-08 12:30 +0100, Alexandre Belloni spake thusly:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  package/Config.in        |  1 +
>  package/ti-uim/Config.in |  8 ++++++++
>  package/ti-uim/ti-uim.mk | 21 +++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/ti-uim/Config.in
>  create mode 100644 package/ti-uim/ti-uim.mk
[--SNIP--]
> diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
> new file mode 100644
> index 000000000000..86e8b882a8b2
> --- /dev/null
> +++ b/package/ti-uim/ti-uim.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# ti-uim
> +#
> +#############################################################
> +
> +TI_UIM_VERSION = c738944
> +TI_UIM_SITE = git://gitorious.org/uim/uim.git
> +TI_UIM_LICENSE = GPLv2+
> +TI_UIM_LICENSE_FILES = uim.c

I don't think we can consider the source file to be the license file.
We should just consider that there is no license file in this package.

Anyway, 'make legal-info' will copy the source file, so the licensing
information in that file will be available, no need to duplicate it.

> +define TI_UIM_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> +endef
> +
> +define TI_UIM_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/uim \
> +		$(TARGET_DIR)/usr/sbin/uim
> +endef
> +
> +$(eval $(generic-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
