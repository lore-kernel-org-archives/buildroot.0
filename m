From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 21:51:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: add libatomic linkage when
 available
In-Reply-To: <20180617190007.3369-1-bernd.kuhls@t-online.de>
References: <20180617190007.3369-1-bernd.kuhls@t-online.de>
Message-ID: <20180617215108.2df8445c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jun 2018 21:00:07 +0200, Bernd Kuhls wrote:

> +# Uses __atomic_fetch_add_4 and __atomic_fetch_sub_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +TOR_CONF_OPTS += LIBS=-latomic
> +endif

We already have https://patchwork.ozlabs.org/patch/929615/ pending.

Though as usual, I'd prefer to have a solution that can be contributed
upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
