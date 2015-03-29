From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 13:38:52 +0200
Subject: [Buildroot] [PATCH] distclean: clean a bit more
In-Reply-To: <1427622981-2566-1-git-send-email-yann.morin.1998@free.fr>
References: <1427622981-2566-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150329133852.0b7a4930@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 29 Mar 2015 11:56:21 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 33a89b1..edb122b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -843,7 +843,8 @@ endif
>  ifeq ($(O),output)
>  	rm -rf $(O)
>  endif
> -	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
> +	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
> +		$(CONFIG_DIR)/.auto.deps

Applied, thanks. Any reason to not also remove .config.cmd ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
