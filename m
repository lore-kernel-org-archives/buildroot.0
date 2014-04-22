From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 17:52:44 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: add host-zic dependency
In-Reply-To: <1398181285-4260-1-git-send-email-ps.report@gmx.net>
References: <1398181285-4260-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140422175244.5efaa18d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 22 Apr 2014 17:41:25 +0200, Peter Seiderer wrote:

> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 11b167a..2606e25 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -29,6 +29,9 @@ endif
>  ifeq ($(BR2_PACKAGE_TZDATA),y)
>  	POSTGRESQL_DEPENDENCIES += tzdata
>  	POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
> +else
> +	POSTGRESQL_DEPENDENCIES += host-zic
> +	POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
>  endif

I'm not entirely sure to understand how this works. If
BR2_PACKAGE_TZDATA is not enabled, where will host-zic find the
time-zone informations?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
