From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 10:50:41 +0100
Subject: [Buildroot] FW: [PATCH] linux-headers: cross compile fix
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006BF4D@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF4D@ezex10.ezchip.com>
Message-ID: <20140223105041.414123e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 23 Feb 2014 08:29:15 +0000, Noam Camus wrote:
> Otherwise compiler not found errors occured.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  package/linux-headers/linux-headers.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 30d3076..632b94f 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -25,6 +25,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
>  			HOSTCFLAGS="$(HOSTCFLAGS)" \
>  			HOSTCXX="$(HOSTCXX)" \
>  			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
> +			CROSS_COMPILE="$(TARGET_CROSS)" \
>  			headers_install)
>  endef
>  

Doesn't look harmful in principle, but it seems to have worked until
now without CROSS_COMPILE="$(TARGET_CROSS)". Can you expand the commit
log by explaining in which case you have seen errors, and which errors.
The linux-headers package is used daily to build toolchains by all
Buildroot users, so I'd like to understand how your situation is
different. Is it that the ARC kernel headers need something special?
But we are building ARC toolchains everyday in the autobuilders, with
no problem. That's why I'd like to have more details.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
