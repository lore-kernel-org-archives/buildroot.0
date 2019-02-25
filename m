From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:20:58 +0100
Subject: [Buildroot] [PATCH next 1/1] package/libwebsockets: bump
 version to 3.1.0
In-Reply-To: <20190223201736.106101-1-aduskett@gmail.com>
References: <20190223201736.106101-1-aduskett@gmail.com>
Message-ID: <20190225222058.1d0a106b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sat, 23 Feb 2019 15:17:36 -0500
aduskett at gmail.com wrote:

> +-if (LWS_WITH_LIBEV AND LWS_WITH_LIBEVENT)
> +-	message(FATAL_ERROR "Sorry libev and libevent conflict with each others' namespace, you can only have one or the other")
> +-endif()

I'm a bit confused by this patch. Why are removing this check ? If
libwebsockets is anyway only using libev *or* libevent, what about
changing libwebsockets.mk to only allow using one or the other ?

This is the only point I've seen, the rest looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
