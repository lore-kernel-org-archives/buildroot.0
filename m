From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Jan 2018 13:34:05 +0200
Subject: [Buildroot] [PATCH] package/bash-completion: new package
In-Reply-To: <1515669446-25694-1-git-send-email-romain.naour@smile.fr>
References: <1515669446-25694-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180111113405.75bmtmbatomzwxne@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, Jan 11, 2018 at 12:17:26PM +0100, Romain Naour wrote:
> From: Jeremy Rosen <jeremy.rosen@smile.fr>
> 
> Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---

[...]

> +################################################################################
> +#
> +# bash-completion
> +#
> +################################################################################
> +
> +BASH_COMPLETION_VERSION = 2.7
> +BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
> +BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
> +BASH_COMPLETION_LICENSE = GPL-2.0+
> +BASH_COMPLETION_LICENSE_FILES = COPYING
> +
> +define BASH_COMPLETION_INSTALL_TARGET_CMDS
> +	echo ". /usr/share/bash-completion/bash_completion" > $(TARGET_DIR)/etc/bash_completion
> +endef

How do you install the completion scripts?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
