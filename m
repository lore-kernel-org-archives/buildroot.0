From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 24 Sep 2013 17:46:00 +0100
Subject: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging
 directory for userspace i2c drivers.
In-Reply-To: <20130924172041.57ec6b88@skate>
References: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
 <20130924172041.57ec6b88@skate>
Message-ID: <5241C1C8.4010809@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/09/2013 16:20, Thomas Petazzoni wrote:
> Dear Jouko Nikula,
>
> On Tue, 24 Sep 2013 13:18:43 +0300, Jouko Nikula wrote:
>
>> +define I2C_TOOLS_INSTALL_STAGING_CMDS
>> +	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux/
>> +endef
>
> This header is already part of the kernel headers, so it should already
> be part of the toolchain. Do you have a specific case where this header
> is missing?
>

The contents of the header are different, the one from i2c-tools 
contains more.

We also carry a patch similar to this. Our patch has an addition which 
is a dependency on linux (assuming it is selected in the config). This 
ensures that the header from the kernel gets over ridden by the one from 
i2c-tools and not the other way around.

Regards
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
