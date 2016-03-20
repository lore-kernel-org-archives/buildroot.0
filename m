From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:09:08 +0100
Subject: [Buildroot] [PATCH 2/2] zeromq: add norm support
In-Reply-To: <1457516142-7421-2-git-send-email-gustavo@zacarias.com.ar>
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
 <1457516142-7421-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320230908.3e482958@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 06:35:42 -0300, Gustavo Zacarias wrote:
> +ifeq ($(BR2_PACKAGE_ZEROMQ_NORM),y)
> +ZEROMQ_CONF_OPTS += --with-norm
> +ZEROMQ_DEPENDENCIES += norm
> +endif

I've added an else clause that adds --without-norm to the configure
options, and applied.

>  ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
>  ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
>  ZEROMQ_CONF_OPTS += --with-pgm

... and I've done a follow-up commit that adds --without-pgm in the
else clause here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
