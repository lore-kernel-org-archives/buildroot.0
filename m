From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 18:34:54 +0100
Subject: [Buildroot] [PATCH v6 01/13] package/linux-headers: cleanup
 installation
In-Reply-To: <1454342021-22960-2-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20160201183454.55693d2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon,  1 Feb 2016 16:53:29 +0100, Samuel Martin wrote:
> This patch removes unnecessary files generated during installation.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5 -> v6:
> - new patch
> ---
>  package/linux-headers/linux-headers.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 1b8b81b..872ef8f 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -53,6 +53,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
>  			HOSTCXX="$(HOSTCXX)" \
>  			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
>  			headers_install)
> +	find $(STAGING_DIR)/usr \( -name .install -o -name ..install.cmd \) -delete

Why? Are they causing specific problems? Some better justification in
the commit log would be good, because we generally don't add code to
clean up things in staging.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
