From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:35:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/synergy: bump to version 1.8.5
In-Reply-To: <1481136388-11727-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1481136388-11727-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20170326223514.240143a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Dec 2016 19:46:28 +0100, Pieterjan Camerlynck wrote:
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>

Thanks for this patch, and sorry for the very slow response. It mostly
looks good, except two things, one being fairly important.

> +# synergy cannot be built without extracting the included gtest
> +define SYNERGY_EXTRACT_GTEST
> +	$(UNZIP) $(@D)/ext/gtest-1.6.0.zip -d $(@D)/ext/gtest-1.6.0
> +endef
> +SYNERGY_POST_EXTRACT_HOOKS += SYNERGY_EXTRACT_GTEST

This is not very nice. Can we instead use the gtest from Buildroot
package/gtest/ package ?

> +define SYNERGY_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/synergyc $(TARGET_DIR)/usr/bin
> +	$(INSTALL) -D -m 0755 $(@D)/bin/synergys $(TARGET_DIR)/usr/bin

You should use full destination paths here, i.e:

	$(TARGET_DIR)/usr/bin/synergyc

Could you look into those two issues and submit an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
