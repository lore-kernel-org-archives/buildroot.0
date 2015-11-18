From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 09:22:10 +0100
Subject: [Buildroot] [PATCH] hidapi: new package
In-Reply-To: <20151118045051.GO9908@tarshish>
References: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151116180724.GK9908@tarshish> <564AFD4E.2000301@imgtec.com>
 <20151118045051.GO9908@tarshish>
Message-ID: <20151118092210.30ff22d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, 18 Nov 2015 06:50:51 +0200, Baruch Siach wrote:

> > Of course we could use ifeq ($(BR2_PACKAGE_LIBGUDEV),y) here, but, for
> > consistency with Config.in, I use ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > instead. See for instance the udisks package.
> 
> I think this is wrong. First, consistency with Config.in calls for using 
> BR2_PACKAGE_LIBGUDEV like we do with all other selects. But more
> importantly, IMO, we only use the <pkg>_DEPENDENCIES variable to set
> the build order which is conceptually independent of the underlying
> reason we need this dependency, systemd in this case. I think that
> all the other packages that Thomas mentioned should also test for
> BR2_PACKAGE_LIBGUDEV when setting <pkg>_DEPENDENCIES.

I am not as clear-cut as you are on what is the correct thing to do
here, but your reasoning seems reasonable to me. So we need to align
the existing packages to do this, and also to use BR2_INIT_SYSTEMD in
Config.in (udisks uses BR2_PACKAGE_SYSTEMD). Will you send some patches
or should I do so?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
