From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 11:29:15 +0200
Subject: [Buildroot] [PATCH] cannelloni: make SCTP support optional
In-Reply-To: <1460971323-520-1-git-send-email-yegorslists@googlemail.com>
References: <1460971323-520-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160418112915.1fe9e741@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 11:22:03 +0200, yegorslists at googlemail.com wrote:

> +if BR2_PACKAGE_CANNELLONI
> +
> +config BR2_PACKAGE_CANNELLONI_SCTP
> +	bool "SCTP support"
> +	select BR2_PACKAGE_LKSCTP_TOOLS
> +	help
> +	  This option enables support for Stream Control Transmission
> +	  Protocol (SCTP)
> +endif

Could we make this an automatic optional dependency instead?

> +ifeq ($(BR2_PACKAGE_CANNELLONI_SCTP),y)

I.e replace this with:

ifeq ($(BR2_PACKAGE_LKSCTP_TOOLS),y)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
