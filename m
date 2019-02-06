From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:19:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/zeromq: Allow building with
 draft APIs enabled
In-Reply-To: <20190205102814.11288-1-lionel@svkt.org>
References: <20190205102814.11288-1-lionel@svkt.org>
Message-ID: <20190206171938.7ab69799@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lionel,

On Tue,  5 Feb 2019 11:28:13 +0100
Lionel Flandrin <lionel@svkt.org> wrote:

> Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> ---
>  package/zeromq/Config.in | 7 +++++++
>  package/zeromq/zeromq.mk | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> index 69be9f002c..fdcdebc691 100644
> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -52,4 +52,11 @@ config BR2_PACKAGE_ZEROMQ_PGM
>  	  3208) implemented either over raw IP packets or UDP
>  	  datagrams (encapsulated PGM).
>  
> +config BR2_PACKAGE_ZEROMQ_DRAFTS
> +	bool "Enable ZeroMQ draft APIs"

Changed to:

	bool "Draft APIs support"

> +ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
> +ZEROMQ_CONF_OPTS += --enable-drafts

Added:

else
ZEROMQ_CONF_OPTS += --disable-drafts

Applied with those changes!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
