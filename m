From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:29:19 +0200
Subject: [Buildroot] [PATCH 1/4] package/openssh: Depend on libaudit if
 available
In-Reply-To: <20200605225905.14082-1-nolange79@gmail.com>
References: <20200605225905.14082-1-nolange79@gmail.com>
Message-ID: <20200606222919.03831690@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 00:59:01 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/openssh/openssh.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 515eec2c03..55b917e20a 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -39,6 +39,11 @@ else
>  OPENSSH_CONF_OPTS += --without-ssl-engine
>  endif
>  
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +OPENSSH_DEPENDENCIES += audit
> +OPENSSH_CONF_OPTS += --with-audit=linux
> +endif

We like to have an "else" clause that explicitly disables the feature,
so I've added that, reworked the commit title, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
