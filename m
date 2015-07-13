From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 23:23:17 +0200
Subject: [Buildroot] [PATCH] avahi: fix systemd service file install path
In-Reply-To: <1436813720-4458-1-git-send-email-aurelien@chabot.fr>
References: <1436813720-4458-1-git-send-email-aurelien@chabot.fr>
Message-ID: <20150713232317.0972c4f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aur?lien Chabot,

On Mon, 13 Jul 2015 20:55:20 +0200, Aur?lien Chabot wrote:
> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> ---
>  package/avahi/avahi.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 24967f4..b241748 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -90,8 +90,11 @@ AVAHI_DEPENDENCIES = \
>  
>  AVAHI_CFLAGS = $(TARGET_CFLAGS)
>  
> -ifeq ($(BR2_PACKAGE_SYSTEMD),)
> -AVAHI_CFLAGS += -DDISABLE_SYSTEMD
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +	AVAHI_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system

Such variable assignments should not be indented.

Committed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
