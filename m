From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Mar 2018 13:51:04 +0200
Subject: [Buildroot] [V4 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180328083827.31540-1-francois.perrad@gadz.org>
References: <20180328083827.31540-1-francois.perrad@gadz.org>
Message-ID: <20180328135104.61e8e835@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Mar 2018 10:38:26 +0200, Francois Perrad wrote:

> +define DROPBEAR_SVR_PASSWORD_AUTH
> +	echo '#if !HAVE_CRYPT'                          >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
> +	echo '#endif'                                   >> $(@D)/localoptions.h
>  endef

Since this is really a bug in dropbear, shouldn't this be handled by a
patch, which gets submitted upstream ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
