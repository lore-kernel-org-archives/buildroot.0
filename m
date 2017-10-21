From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 15:49:02 +0200
Subject: [Buildroot] [PATCH 02/12] tini: new package
In-Reply-To: <20171019002257.27646-2-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-2-christian@paral.in>
Message-ID: <20171021154902.37edd1b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 20:22:47 -0400, Christian Stewart wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +TINI_CFLAGS += -fstack-protector --param=ssp-buffer-size=4
> +endif

I don't think we want this. Buildroot already passes -fstack-protector
globally when BR2_SSP_REGULAR / BR2_SSP_STRONG / BR2_SSP_ALL.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
