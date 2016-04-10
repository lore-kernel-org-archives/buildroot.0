From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Apr 2016 10:32:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] ipmitool: fix musl build
In-Reply-To: <1460236490-16747-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460236490-16747-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160410103211.0bdc4d05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Apr 2016 23:14:50 +0200, J?rg Krause wrote:

> +# This is needed to make autoreconf happy
> +define IPMITOOL_CREATE_MISSING_FILES
> +	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog $(@D)/COPYING
> +endef
> +IPMITOOL_POST_EXTRACT_HOOKS += IPMITOOL_CREATE_MISSING_FILES

Instead of this, just pass "foreign" in the arguments of
AM_INIT_AUTOMAKE in configure.ac.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
