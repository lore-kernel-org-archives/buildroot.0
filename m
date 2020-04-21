From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:54:41 +0200
Subject: [Buildroot] [PATCH] package/collectd: make network crypto
 support discoverable
In-Reply-To: <877dyrqo04.fsf@dell.be.48ers.dk>
References: <20200311133504.13911-1-p.debruijn@unilogic.nl>
 <877dyrqo04.fsf@dell.be.48ers.dk>
Message-ID: <20200421225441.640279ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 07 Apr 2020 18:06:19 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > +config BR2_PACKAGE_COLLECTD_NETWORK_GCRYPT
>  > +	bool "crypto support"
>  > +	depends on BR2_PACKAGE_COLLECTD_NETWORK
>  > +	select BR2_PACKAGE_LIBGCRYPT
>  > +	help
>  > +	  Enable crypto support  
> 
> It would IMHO also make sense to change the conditional in collectd.mk
> to use this symbol so crypto support is really disabled if this option
> is turned off, otherwise it is just confusing in the other direction
> now.

Indeed. Pascal, could you send a patch implementing this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
