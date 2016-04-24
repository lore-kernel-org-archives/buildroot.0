From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 10:23:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/freeswitch: disable ClueCon
 invitation messages
In-Reply-To: <1461445189-31992-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461445189-31992-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160424102314.55807830@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 22:59:48 +0200, Bernd Kuhls wrote:

> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index f25b9fa..ec52172 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -153,6 +153,8 @@ define FREESWITCH_ENABLE_MODULES
>  	$(Q)echo $(FREESWITCH_ENABLED_MODULES) \
>  		| tr ' ' '\n' \
>  		> $(@D)/modules.conf
> +	> $(@D)/noreg
> +	> $(@D)/cluecon2.tmpl

Doesn't this deserve a separate pre-configure hook? Doing this hidden
in the FREESWITCH_ENABLE_MODULES hook, with no comment or explanation
whatsoever looks a bit weird.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
