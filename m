From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:30:32 +0200
Subject: [Buildroot] [PATCH 5/6] vde2: enable building host package
In-Reply-To: <1462348079-7631-5-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
 <1462348079-7631-5-git-send-email-simonn.maes@gmail.com>
Message-ID: <20160704003032.47bb75ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 May 2016 09:47:58 +0200, Simon Maes wrote:
> In preparation of enabling vde2 support in host-qemu package.
> 
> Signed-off-by: Simon Maes <simonn.maes@gmail.com>
> ---
>  package/vde2/vde2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
> index bad758d..13fecd3 100644
> --- a/package/vde2/vde2.mk
> +++ b/package/vde2/vde2.mk
> @@ -38,3 +38,4 @@ VDE2_CONF_OPTS = \
>  VDE2_MAKE = $(MAKE1)
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

You forgot to define HOST_VDE2_CONF_OPTS and HOST_VDE2_MAKE, so I've
added these and sent the changed version as part of my respin. See
http://patchwork.ozlabs.org/patch/643848/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
