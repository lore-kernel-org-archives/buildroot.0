From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 22:46:29 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gnupg2: add bzip2 optional
 dependency
In-Reply-To: <1411509457-8182-2-git-send-email-romain.naour@openwide.fr>
References: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
 <1411509457-8182-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141001224629.09e48dbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 23 Sep 2014 23:57:36 +0200, Romain Naour wrote:
> This is to improve build reproducibility.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: improve commit log
> 
>  package/gnupg2/gnupg2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index af475bb..3fce998 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -30,4 +30,10 @@ endef
>  GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV2
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BZIP2),y)
> +GNUPG2_DEPENDENCIES += bzip2

I've added --enable-bzip2 --with-bzip2=$(STAGING_DIR) here and applied
your patch.

Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
