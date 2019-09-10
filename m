From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 18:03:12 +0200
Subject: [Buildroot] [PATCH v4] package/nfs-utils: enable IPv6 if
 libtirpc is selected
In-Reply-To: <0209c0f3-3bdf-aa01-0c21-c5d775f819fc@mind.be>
References: <20190910105910.32098-1-unixmania@gmail.com>
 <0209c0f3-3bdf-aa01-0c21-c5d775f819fc@mind.be>
Message-ID: <20190910180312.3e30d72f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Sep 2019 14:23:15 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Oh dear, we're running in circles here...

Absolutely.

>  Due to the select, all of this becomes unconditional.
> 
>  In other words, we should:
> 
> - select libtirpc unconditionally;
> - add libtirpc to _DEPENDENCIES unconditionally;
> - add --enable-tirpc --enable-ipv6 to CONF_OPTS unconditionally;
> - leave the help text unchanged since libtirpc is anyway selected;
> - make it clear in the commit message that libtirpc is anyway selected by
> rpcbind, so we can just as well select it unconditionally in nfs-utils.

Fully agreed.

>  Again, I'm very sorry that it takes us five iterations and several months to
> come to this conclusion...

Yes, indeed. But sometimes that what it takes to finally understand
each other and find what the good solution is.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
