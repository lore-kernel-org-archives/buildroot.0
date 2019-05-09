From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 08:54:56 +0200
Subject: [Buildroot] [PATCH 05/13] package/pkg-generic.mk: add
 _INSTALL_INIT_OPENRC
In-Reply-To: <20190508220937.23200-5-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
 <20190508220937.23200-5-michal.lyszczek@bofc.pl>
Message-ID: <20190509085456.3e1583f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micha?,

On Thu,  9 May 2019 00:09:29 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> Add _INSTALL_INIT_OPENRC so packages can define own steps to perform
> to install openrc service scripts.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> ---
>  package/pkg-generic.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 67782138b4..6d63c46a5b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -337,6 +337,8 @@ $(BUILD_DIR)/%/.stamp_target_installed:
>  		$($(PKG)_INSTALL_INIT_SYSTEMD))
>  	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
>  		$($(PKG)_INSTALL_INIT_SYSV))
> +	$(if $(BR2_INIT_OPENRC), \
> +		$($(PKG)_INSTALL_INIT_OPENRC))

This addition will require an update to the Buildroot manual, in
adding-packages-generic.txt, where the other <pkg>_INSTALL_INIT_*
variables are described.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
