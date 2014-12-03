From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2014 23:38:32 +0100
Subject: [Buildroot] [PATCH 2/2] rp-pppoe: install helper scripts
In-Reply-To: <87tx1cwejb.fsf@dell.be.48ers.dk>
References: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
 <1417562463-26561-2-git-send-email-bluemrp9@gmail.com>
 <20141203232625.0ce7b9a5@free-electrons.com>
 <87tx1cwejb.fsf@dell.be.48ers.dk>
Message-ID: <20141203233832.4499c590@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 03 Dec 2014 23:32:08 +0100, Peter Korsgaard wrote:
>  >> @@ -23,6 +25,9 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
>  >> for ff in $(RP_PPPOE_TARGET_FILES); do \
>  >> $(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
>  >> done
>  >> +	for ff in $(RP_PPPOE_TARGET_SCRIPTS); do \
>  >> +		$(INSTALL) -m 0755 $(@D)/scripts/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
>  >> +	done
> 
>  > Both variables do the same thing.
> 
> No, they copy from two different subdirs?

Gaah, my bad, I overlooked that. Indeed, both variables are needed
then. So the patch looks OK to me.

Sorry for the noise :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
