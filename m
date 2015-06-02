From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2015 22:57:05 +0200
Subject: [Buildroot] [PATCH 1/3] boot/uboot: remove deprecated network
	settings option
In-Reply-To: <1433267534-12710-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 2 Jun 2015 14:52:12 -0300")
References: <1433267534-12710-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2vlrfq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It's been deprecated since the 2014.05 release, so a year has passed.
 > Add legacy info as well to raise a warning when it's used.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 > +++ b/boot/uboot/uboot.mk
 > @@ -131,12 +131,6 @@ define UBOOT_CONFIGURE_CMDS
 >  	@echo "#define __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
 >  	$(call insert_define,DATE,$(DATE))
 >  	$(call insert_define,CONFIG_LOAD_SCRIPTS,1)
 > -	$(call insert_define,CONFIG_IPADDR,$(BR2_TARGET_UBOOT_IPADDR))
 > -	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_TARGET_UBOOT_GATEWAY))
 > -	$(call insert_define,CONFIG_NETMASK,$(BR2_TARGET_UBOOT_NETMASK))
 > -	$(call insert_define,CONFIG_SERVERIP,$(BR2_TARGET_UBOOT_SERVERIP))
 > -	$(call insert_define,CONFIG_ETHADDR,$(BR2_TARGET_UBOOT_ETHADDR))
 > -	$(call insert_define,CONFIG_ETH1ADDR,$(BR2_TARGET_UBOOT_ETH1ADDR))
 >  	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(@D)/include/config.h

Current u-boot doesn't have any references to CONFIG_LOAD_SCRIPTS or
DATE, so I've simply removed the entire config.h fixup.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
