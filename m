From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:07:23 +0200
Subject: [Buildroot] [PATCH 1/7] core/pkg-utils: add macro to
 escape-and-printf
In-Reply-To: <11da03a97bde4e0332be6577a83e1476566d8e9f.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <11da03a97bde4e0332be6577a83e1476566d8e9f.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <20160606230723.7ba46894@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Jun 2016 22:43:38 +0200, Yann E. MORIN wrote:

> +define PRINTF
> +	printf '$(subst $(sep),\n,\
> +			$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
> +				$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
> +					$(subst \,\\,$(1)))))\n'
> +endef

Do we expect this to be used outside of fs/common.mk? Since it's not
the case today, I would suggest to move it there.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
