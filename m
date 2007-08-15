From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 15 Aug 2007 09:42:30 +0200
Subject: [Buildroot] [patch] mdnsresponder doesn't do parallel makes
In-Reply-To: <46C21224.9020505@mainstreetsoftworks.com>
References: <46C21224.9020505@mainstreetsoftworks.com>
Message-ID: <1187163750.4942.1.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-08-14 klockan 16:35 -0400 skrev Brad House:
> Apparently mdnsresponder will fail to build with parallel makes.
> This patch just adds a -j1 to the $(MAKE) to force it to not
> build in parallel.
> 

Buildroot defines $(MAKE1) for this purpose, but
I will fix that, so no need to send a new patch.


> -Brad
> vanligt textdokument-bilaga (mdnsresponder-parallelmake.diff)
> Index: package/mdnsresponder/mdnsresponder.mk
> ===================================================================
> --- package/mdnsresponder/mdnsresponder.mk	(revision 19509)
> +++ package/mdnsresponder/mdnsresponder.mk	(working copy)
> @@ -26,7 +26,7 @@
>  	touch $(MDNSRESPONDER_DIR)/.configured
>  
>  $(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
> -	$(MAKE) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
> +	$(MAKE) -j1 CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
>  	touch $(MDNSRESPONDER_DIR)/.built
>  
>  $(STAGING_DIR)/usr/lib/libdns_sd.so: $(MDNSRESPONDER_DIR)/.built

BR
Ulf Samuelsson
